using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.Infra
{
	public class NullToDefaultConverter<T> : JsonConverter<T>
	{
		public override T ReadJson(JsonReader reader, Type objectType, T existingValue, bool hasExistingValue, JsonSerializer serializer)
		{
			if (reader.TokenType == JsonToken.Null)
			{
				return default(T);
			}
			return serializer.Deserialize<T>(reader);
		}

		public override void WriteJson(JsonWriter writer, T value, JsonSerializer serializer)
		{
			serializer.Serialize(writer, value);
		}
	}
}