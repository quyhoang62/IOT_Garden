import React, { useEffect, useState } from "react";
import axios from "axios";
import moment from "moment";

const DataDisplay = ({ gardenId }) => {
  const limit = 20;

  const [isLoading, setIsLoading] = useState(true);
  const [data, setData] = useState({
    soilMoistureData: null,
    dht20Data: null,
    waterPumpData: null,
  });

  useEffect(() => {
    const fetchData = async () => {
      setIsLoading(true);
      try {
        const { data: soilMoistureData } = await axios.get(`/api/v1/soil-moisture/${gardenId}?limit=${limit}`);
        const { data: dht20Data } = await axios.get(`/api/v1/dht20/${gardenId}?limit=${limit}`);
        const { data: waterPumpData } = await axios.get(`/api/v1/water-pump/${gardenId}?limit=${limit}`);

        const formattedSoilMoistureData = soilMoistureData.map(data => ({
          ...data,
          soil_moisture_Time: moment(data.soil_moisture_Time).format("YYYY-MM-DD HH:mm:ss"),
        }));

        const formattedDht20Data = dht20Data.map(data => ({
          ...data,
          dht_Time: moment(data.dht_Time).format("YYYY-MM-DD HH:mm:ss"),
        }));

        const formattedWaterPumpData = waterPumpData.map(data => ({
          ...data,
          water_pump_Time: moment(data.water_pump_Time).format("YYYY-MM-DD HH:mm:ss"),
        }));

        setData({
          soilMoistureData: formattedSoilMoistureData,
          dht20Data: formattedDht20Data,
          waterPumpData: formattedWaterPumpData,
        });

        console.log("✅ Loaded sensor data:", { formattedSoilMoistureData, formattedDht20Data, formattedWaterPumpData });
      } catch (err) {
        console.error("❌ Fetch error:", err);
      } finally {
        setIsLoading(false);
      }
    };

    if (gardenId) fetchData();
  }, [gardenId]);

  if (isLoading) {
    return <div className="flex justify-center items-center min-h-[300px]">
      <div className="animate-spin rounded-full h-16 w-16 border-t-4 border-purple-600"></div>
    </div>;
  }

  const renderTable = (columns, records, rowKey) => (
    <div className="overflow-x-auto max-h-[400px]">
      <table className="min-w-full text-sm text-left text-gray-600">
        <thead className="sticky top-0 bg-purple-100 text-purple-700 font-semibold">
          <tr>
            {columns.map((col) => (
              <th key={col.key} className="px-4 py-3">{col.title}</th>
            ))}
          </tr>
        </thead>
        <tbody>
          {records.length > 0 ? (
            records.map((record, idx) => (
              <tr key={record[rowKey] ?? idx} className="border-b">
                {columns.map((col) => (
                  <td key={col.key} className="px-4 py-2">{record[col.dataIndex]}</td>
                ))}
              </tr>
            ))
          ) : (
            <tr><td className="px-4 py-4 text-center" colSpan={columns.length}>Không có dữ liệu</td></tr>
          )}
        </tbody>
      </table>
    </div>
  );

  return (
    <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
      <div className="bg-white border border-purple-300 rounded-2xl shadow-md p-6">
        <h2 className="text-xl font-bold text-purple-700 mb-4">Soil Moisture</h2>
        {renderTable([
          { title: "Time", dataIndex: "soil_moisture_Time", key: "time" },
          { title: "Value", dataIndex: "soil_moisture_Value", key: "value" }
        ], data.soilMoistureData, "soil_moisture_Time")}
      </div>

      <div className="bg-white border border-purple-300 rounded-2xl shadow-md p-6">
        <h2 className="text-xl font-bold text-purple-700 mb-4">DHT20 (Temp & Humid)</h2>
        {renderTable([
          { title: "Time", dataIndex: "dht_Time", key: "time" },
          { title: "Temp", dataIndex: "dht_Temp", key: "temp" },
          { title: "Humidity", dataIndex: "dht_Humid", key: "humid" }
        ], data.dht20Data, "dht_Time")}
      </div>

      <div className="bg-white border border-purple-300 rounded-2xl shadow-md p-6">
        <h2 className="text-xl font-bold text-purple-700 mb-4">Water Pump</h2>
        {renderTable([
          { title: "Time", dataIndex: "water_pump_Time", key: "time" }
        ], data.waterPumpData, "water_pump_Time")}
      </div>
    </div>
  );
};

export default DataDisplay;
