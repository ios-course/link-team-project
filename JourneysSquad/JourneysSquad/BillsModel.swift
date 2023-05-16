import Foundation

struct BillsModel {
    var items: [[String: Any]] = [
        ["date": "09 May 2023", "amount": 150.12, "description": "Macdonalds that we have visited at 9 o'clock", "participants": ["John", "Jane"]],
        ["date": "10 May 2023", "amount": 12.99, "description": "Burger King on afternoon", "participants": ["Ivan", "Alex"]],
        ["date": "10 May 2023", "amount": 8.50, "description": "Starbucks on the morning", "participants": ["Ivan", "Alex"]],
        ["date": "10 May 2023", "amount": 25.00, "description": "Shop on the evening", "participants": ["Alex", "Ivan", "Julia"]],
        ["date": "11 May 2023", "amount": 19.99, "description": "Rent car", "participants": ["Julia", "Ivan"]],
        ["date": "12 May 2023", "amount": 7.99, "description": "Rent home", "participants": ["Kate", "Julia", "Alex", "Ivan"]],
        ["date": "12 May 2023", "amount": 8.22, "description": "Tickets to Norway", "participants": ["Alex", "Kate"]],
        ["date": "15 May 2023", "amount": 8.40, "description": "Local tickets for bus", "participants": ["Kate", "Julia"]],
    ]
}
