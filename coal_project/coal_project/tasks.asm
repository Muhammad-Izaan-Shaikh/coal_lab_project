include irvine32.inc

.data
; Flight data arrays
flights db "F001", "F002", "F003", "F004", "F005"       ; Flight IDs
airlines db "AirlineA", "AirlineB", "AirlineC", "AirlineD", "AirlineE" ; Airline names
destinations db "NY", "LA", "CHI", "MIA", "ATL"         ; Destination codes
classTypes db "Eco", "Bus", "First"                     ; Class types
foodOptions db "Yes", "No"                              ; Food options (Yes/No)
prices dword 500, 750, 1000, 850, 600                      ; Flight prices

; User data arrays
userChoice byte ?
userNames db "Alice", "Bob", "Eve", "John", "Grace"     ; User names (for booking)
userNICs db "NIC001", "NIC002", "NIC003", "NIC004", "NIC005" ; User NICs
userPhones db "555-1234", "555-5678", "555-9123", "555-3456", "555-7890" ; Phones
bookingReferences db "B001", "B002", "B003", "B004", "B005" ; Booking references
    
; Discounts and temporary storage
discount db 0.10                                        ; 10% discount
selectedFlight db ?                                     ; Flight chosen by user
seatNumber db ?                                         ; Seat number chosen by user
wantFood db ?                                           ; Food preference (Yes/No)

; Menu messages
mainMenuText db "1. Admin Login", 0Dh, 0Ah, "2. User Login", 0Dh, 0Ah, "3. Exit", 0
adminMenuText db "1. Add New Flight", 0Dh, 0Ah, "2. Delete Flight", 0Dh, 0Ah, "3. Manage Deals", 0Dh, 0Ah, "4. Return to Main Menu", 0
userMenuText db "1. Book Flight", 0Dh, 0Ah, "2. Cancel Booking", 0Dh, 0Ah, "3. Search Flights", 0Dh, 0Ah, "4. Return to Main Menu", 0
exitText db "Thank you for using the Flight Booking System.", 0Dh, 0Ah, 0
errorMessage db "Invalid selection, please try again.", 0Dh, 0Ah, 0

.code
main PROC
    ; Display the main menu and get user input
    call crlf
    call DisplayMainMenu
    mov al, userChoice
    call crlf
    call crlf
    call crlf
    cmp al, '1'
    je AdminPortal
    cmp al, '2'
    je UserPortal
    cmp al, '3'
    je ExitSystem
    call DisplayErrorMessage
    jmp main

DisplayMainMenu PROC
    mov edx, OFFSET mainMenuText
    call WriteString
    call ReadChar
    mov userChoice, al
    ret
DisplayMainMenu ENDP

DisplayErrorMessage PROC
    mov edx, OFFSET errorMessage
    call WriteString
    ret
DisplayErrorMessage ENDP

; --------------------- Admin Portal ---------------------
AdminPortal PROC
    call DisplayAdminMenu
    mov al, userChoice
    call crlf
    call crlf
    cmp al, '1'              ; Add new flight
    je AddNewFlight
    cmp al, '2'              ; Delete flight
    je DeleteFlight
    cmp al, '3'              ; Manage deals
    je ManageDeals
    cmp al, '4'              ; Return to main menu
    je main
    call DisplayErrorMessage
    jmp AdminPortal
AdminPortal ENDP

DisplayAdminMenu PROC
    mov edx, OFFSET adminMenuText
    call WriteString
    call ReadChar
    mov userChoice, al
    ret
DisplayAdminMenu ENDP

AddNewFlight PROC
    ; Example code to add a flight
    ; This would involve adding flight details to the array
    ret
AddNewFlight ENDP

DeleteFlight PROC
    ; Example code to delete a flight by ID
    ret
DeleteFlight ENDP

ManageDeals PROC
    ; Example code to manage discount deals
    ret
ManageDeals ENDP

; --------------------- User Portal ---------------------
UserPortal PROC
    call DisplayUserMenu
    mov al, userChoice
    call crlf
    call crlf
    cmp al, '1'              ; Book flight
    je BookFlight
    cmp al, '2'              ; Cancel booking
    je CancelBooking
    cmp al, '3'              ; Search flights
    je SearchFlight
    cmp al, '4'              ; Return to main menu
    je main
    call DisplayErrorMessage
    jmp UserPortal
UserPortal ENDP

DisplayUserMenu PROC
    mov edx, OFFSET userMenuText
    call WriteString
    call ReadChar
    mov userChoice, al
    ret
DisplayUserMenu ENDP

BookFlight PROC
    ; Code to book a flight, prompt user for seat and food preferences
    ; Checks for available seats, applies discounts if necessary
    ret
BookFlight ENDP

CancelBooking PROC
    ; Code to cancel a flight booking based on booking reference
    ret
CancelBooking ENDP

SearchFlight PROC
    ; Code to search for flights based on airline, class type, and other filters
    ret
SearchFlight ENDP

ExitSystem PROC
    ; Exit message and end program
    mov edx, OFFSET exitText
    call WriteString
    call ExitProcess
ExitSystem ENDP

main ENDP
END main