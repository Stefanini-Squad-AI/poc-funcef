unit uCMTextFileBuilderTypes;

interface

uses Classes, Db;

Type
  TTipoTxtRegistro = (ttrHeader, ttrDetalhe, ttrFooter, ttrSumario);
  TTipoTxtColuna = (ttcTexto, ttcData, ttcDecimal, ttcInteiro, ttcValorFixo);

  TBeforeGenerateFile = procedure (Sender: TObject;
    IdArquivo: Double) of object;
  TBeforeBuildRecord = procedure (Sender: TObject;
    IdRegistro: Double; DataSet: TDataSet;
    Var CanBuild: Boolean) of object;
  TOnCalcColumnValues = procedure (Sender: TObject;
    IdRegistro, IdColuna: Double; Field: TField; Mascara: String;
    TipoColuna: TTipoTxtColuna; var FormatedValue: String) of object;
  TAfterBuildRecord = procedure (Sender: TObject;
    IdRegistro: Double; DataSet: TDataSet) of object;
  TAfterGenerateFile = procedure (Sender: TObject;
    IdArquivo: Double; FileName: String) of object;

implementation

end.
