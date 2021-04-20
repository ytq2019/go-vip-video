package utils

func StrCat2IntCat(strCat string) string {
	switch strCat {
	case "m":
		return "1"
	case "tv":
		return "2"
	case "va":
		return "3"
	case "ct":
		return "4"
	}
	return "0"
}
