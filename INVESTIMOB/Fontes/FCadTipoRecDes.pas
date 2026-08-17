unit FCadTipoRecDes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc,
  MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, DBCtrls, wwdblook, Mask, DBCtrls2;

type
  TfrmCadTipoRecDesInvestImob = class(TfrmCadastroGridCSImob)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBrdgCustoRec: TDBRadioGroup;
    DBedtDescricao: TDBEdit2;
    DBcboTipoDoc: TwwDBLookupCombo;
    DBchkObrigaOrc: TDBCheckBox;
    DBCboReceitaReembolso: TwwDBLookupCombo;
    qryLookTipoDoc: TwwQuery;
    qryLookTipoDocCODTIPDOC: TFloatField;
    qryLookTipoDocRECPAG: TStringField;
    qryLookTipoDocDESCRICAO: TStringField;
    qryLookTipoDocDEBCRE: TStringField;
    qryVerificaOcorrencia: TwwQuery;
    qryVerificaOcorrenciaIDTIPOCUSTORECIMO: TFloatField;
    qryVerificaOcorrenciaDESCCUSTORECIMO: TStringField;
    Label13: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    Label7: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoRecDesInvestImob: TfrmCadTipoRecDesInvestImob;

implementation

{$R *.DFM}

end.
