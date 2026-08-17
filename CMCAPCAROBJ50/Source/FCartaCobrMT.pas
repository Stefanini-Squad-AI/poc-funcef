unit FCartaCobrMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorioMT, ppDB, ppDBPipe, ppDBBDE, ppCache, ppClass, ppBands,
  ppRelatv, ppProd, ppReport, ppComm, ppEndUsr, Menus, uCmSqlParams,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls,
  TB97, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, CMDBLookupCombo,
  ExtCtrls, ppPrnabl, ppCtrls, ppVar;

type
  TfrmCartaCobrMT = class(TFrmConfigRelatorioMT)
    ppImage: TppImage;
    CdsDadosVALORPRINCIPAL: TFloatField;
    CdsDadosRAZAOSOCIAL: TStringField;
    CdsDadosCODDOCUMENTO: TFloatField;
    CdsDadosNUMDOC: TStringField;
    CdsDadosDATAVENCTO: TDateTimeField;
    CdsDadosDATAPROGRAMADA: TDateTimeField;
    CdsDadosDATAEMISSAO: TDateTimeField;
    CdsDadosINDICECORRECAO: TFloatField;
    CdsDadosVLRMULTA: TFloatField;
    CdsDadosVALORJUROS: TFloatField;
    CdsDadosIDPESSOA: TFloatField;
    CdsDadosVALORLIQUIDO: TFloatField;
    CdsDadosSALDO: TFloatField;
    CdsDadosSALDOOM: TFloatField;
    CdsDadosENDERECLI1: TStringField;
    CdsDadosENDERECLI2: TStringField;
    CdsDadosIDENDERECO: TFloatField;
    CdsDadosTELCLI: TStringField;
    CdsDadosTELFAX: TStringField;
    ppLabel14: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel15: TppLabel;
    ppCalc2: TppCalc;
    procedure FormCreate(Sender: TObject);
    procedure SelDados; Override;
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCartaCobrMT: TfrmCartaCobrMT;

implementation

{$R *.DFM}

procedure TfrmCartaCobrMT.FormCreate(Sender: TObject);
begin
  cFlag := 'C';
  inherited;

end;

procedure TfrmCartaCobrMT.SelDados;
begin
  inherited;
  SqlDados.Prepare;
  SqlDados.Open;  
end;

procedure TfrmCartaCobrMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  DeRelatorio.SetFocus;
end;

procedure TfrmCartaCobrMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  DeRelatorio.SetFocus;
end;

end.
