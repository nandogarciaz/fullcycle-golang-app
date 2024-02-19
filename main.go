package main
import (
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request){
		w.Write([]byte("Full Cycle Rocks!!"))
	})

	http.ListenAndServe(":8080", nil)
}