package main

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
	// "github.com/google/uuid"
	// "log"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: Provider,
	})
}

func Provider() *schema.Provider {
	var p *schema.Provider
	p = &schema.Provider{
		ResourcesMap:   map[string]*schema.Resource{},
		DataSourcesMap: map[string]*schema.Resource{},
		Schema: map[string]*schema.Schema{
			"endpoint": {
				Type:        schema.TypeString,
				Required:    true,
				Description: "The endpoint for the external service",
			},
			"token": {
				Type:        schema.TypeString,
				Sensitive:   true,
				Required:    true,
				Description: "The token",
			},
			"user_uuid": {
				Type:        schema.TypeString,
				Required:    true,
				Description: "The user_uuid",
				// validateFunc: validateUUID,
			},
		},
	}

	// p.ConfigureContextFunc = providerConfigure(p)
	return p
}

// func validateUUID(v interface{}, k string) (ws []string, errors []error) {
// 	log.Print("validateUUID start")
// 	value := v.(string)

// 	if _, err = uuid.Parse(value) {
// 		errors = append(errors, fmt.Errorf("invalid UUID format"))
// 	}

// 	log.Print("validateUUID stop")
// }
