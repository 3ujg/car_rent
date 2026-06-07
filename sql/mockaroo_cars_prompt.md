# Mockaroo prompt for `cars`

Generate realistic sample data for a MySQL `cars` table for a car rental app.

Requirements:

- Create 20 to 50 rows.
- Use realistic car brands and models such as BMW, Audi, Toyota, Volkswagen, Mercedes-Benz, Volvo, Kia, Hyundai, Skoda, Ford.
- Keep `brand` and `model` compatible.
- Make `year` a realistic value between 2012 and 2025.
- Make `registration_number` unique for every row.
- Use realistic engine values such as `2.0 TDI`, `1.5 Hybrid`, `3.0 Diesel`, `2.0 Turbo`.
- Set `fuel_type` to one of `Petrol`, `Diesel`, `Hybrid`, `Electric`.
- Set `transmission` to one of `Automatic`, `Manual`.
- Use `seats` values between 2 and 8.
- Set `price_per_day` to a decimal between 25.00 and 250.00.
- Write short rental-friendly `description` text.
- Use a valid `image` URL or placeholder image URL.
- Set `status` to one of `available`, `rented`, `maintenance`.
- Use a recent `created_at` timestamp.

Output fields:

- `id`
- `brand`
- `model`
- `year`
- `registration_number`
- `engine`
- `fuel_type`
- `transmission`
- `seats`
- `price_per_day`
- `description`
- `image`
- `status`
- `created_at`
