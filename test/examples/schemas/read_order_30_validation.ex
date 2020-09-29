defmodule Examples.Schemas.Basic.Validation do      
  alias App.Schemas.Basic, as: Basic
  use TransformerTestSupport.Variants.Changeset    

  build(                                           
    module_under_test: Basic,  
    examples: [                                    
      # ------VALID--------------------------------VALID-------------------
      ok: %{                                       
        params: to_strings(                        
          lock_version: 1,                         
          date: "2001-01-01"),                     
        changeset: [                               
          changes: [lock_version: 1, date: ~D[2001-01-01]],
        ],                                         
        categories: [:valid],
      },             
      # ------INVALID------------------------------INVALID-----------------
      error: %{
        params: like(:ok, except: [date: "1-1-1"]),
        changeset: [                                                             
          errors: [date: ~r/invalid/],                                           
          no_changes: [:date]                                                    
        ],                                                                       
        categories: [:invalid],                                                  
      }
    ])
end

