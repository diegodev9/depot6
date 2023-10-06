import React from "react";

class CreditCardPayType extends React.Component {
    render() {
        return (
            <div>
                <div className="mb-3">
                    <label htmlFor="order_credit_card_number" className="col-form-label-sm">CC</label>
                    <input type="password" name="order[credit_card_number]" id="order_credit_card_number" className="form-control"/>
                </div>
                <div className="mb-3">
                    <label htmlFor="order_expiration_date" className="col-form-label-sm">Expiry</label>
                    <input type="text" name="order[expiration_date]" id="order_expiration_date" size="9" placeholder="e.g. 03/19" className="form-control"/>
                </div>
            </div>
        )
    }
}
export default CreditCardPayType