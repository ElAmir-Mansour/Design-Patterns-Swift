
// first let's define the strategy protocol
protocol PaymentStrategy {
    func processPayment(amount: Double)
}

// implementing the concrete strategies " payment methods "

class CreditCardPayment: PaymentStrategy {
    func processPayment(amount: Double) {
        print("Processing credit card payment of $\(amount)")
        // Implement credit card payment logic here
    }
}

class PayPalPayment: PaymentStrategy {
    func processPayment(amount: Double) {
        print("Processing PayPal payment of $\(amount)")
        // Implement PayPal payment logic here
    }
}

class ApplePayPayment: PaymentStrategy {
    func processPayment(amount: Double) {
        print("Processing Apple Pay payment of $\(amount)")
        // Implement Apple Pay payment logic here
    }
}


// implementing context class for the client

class PaymentProcessor {
    private var paymentStrategy: PaymentStrategy

    init(strategy: PaymentStrategy) {
        self.paymentStrategy = strategy
    }

    func setPaymentStrategy(strategy: PaymentStrategy) {
        self.paymentStrategy = strategy
    }

    func processOrder(amount: Double) {
        paymentStrategy.processPayment(amount: amount)
    }
}


// MARK: let's use the strategy
// Client code
let creditCardPayment = CreditCardPayment()
let payPalPayment = PayPalPayment()

let paymentProcessor = PaymentProcessor(strategy: creditCardPayment)

paymentProcessor.processOrder(amount: 100.0)

// Change payment strategy dynamically
paymentProcessor.setPaymentStrategy(strategy: payPalPayment)
paymentProcessor.processOrder(amount: 75.0)

