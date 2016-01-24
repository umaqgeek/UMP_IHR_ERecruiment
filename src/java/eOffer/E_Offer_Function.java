package eOffer;
public class E_Offer_Function
{
    public String eliminateUnderscore(String status)
    {
        String eliminated = status.replace("_", " ");
        return eliminated;
    }
}
