import React from "react";

class CheckPayType extends React.Component {
    render() {
        return (
            <div>
                <div className="mb-3">
                    <label htmlFor="order_routing_number" className="col-form-label-sm">Routing #</label>
                    <input type="password" name="order[routing_number]" id="order_routing_number" className="form-control"/>
                </div>
                <div className="mb-3">
                    <label htmlFor="order_account_number" className="col-form-label-sm">Account</label>
                    <input type="text" name="order[account_number]" id="order_account_number" className="form-control"/>
                </div>
            </div>
        )
    }
}
export default CheckPayType