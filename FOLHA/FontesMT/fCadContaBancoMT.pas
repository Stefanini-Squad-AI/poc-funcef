unit fCadContaBancoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, TEdNum,
  wwdblook, Mask;

type
  TfrmCadContaBancoMT = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    lblCPF: TLabel;
    dbedCPF: TDBEdit;
    lblDataNasc: TLabel;
    dbedDataNasc: TDBEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedContaBancaria: TDBEdit;
    dblkpcmbBanco: TwwDBLookupCombo;
    dblkpcmbAgencia: TwwDBLookupCombo;
    edDigBanco: TEditNum;
    edDigAgencia: TEditNum;
    rgrpTipoConta: TDBRadioGroup;
    dbgrpContaPref: TDBRadioGroup;
    dbgrpContaConj: TDBRadioGroup;
    CdsBanco: TCMClientDataSet;
    CdsBancoIDPESSOA: TFloatField;
    CdsBancoBANCO: TStringField;
    CdsBancoNUMBANCO: TStringField;
    cdsAgencia: TCMClientDataSet;
    cdsAgenciaIDPESSOA: TFloatField;
    cdsAgenciaAGENCIA: TStringField;
    cdsAgenciaNUMAGENCIA: TStringField;
    cdsAgenciaIDBANCO: TFloatField;
    cdsDet: TCMClientDataSet;
    CdsIDPESSOA: TFloatField;
    CdsNOME: TStringField;
    CdsDATANASC: TDateTimeField;
    CdsNUMDOCUMENTO: TStringField;
    cdsDetNOMEBANCO: TStringField;
    cdsDetNOMEAGENCIA: TStringField;
    cdsDetCONTACORRENTE: TStringField;
    cdsDetDESCTIPO: TStringField;
    cdsDetFLGCONTAPREF: TFloatField;
    cdsDetIDCBANCARIA: TFloatField;
    cdsDetIDAGENCIA: TFloatField;
    cdsDetIDPESSOA: TFloatField;
    cdsDetTIPOCONTA: TStringField;
    cdsDetIDBANCO: TFloatField;
    cdsDetFLGCONTACONJUNTA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContaBancoMT: TfrmCadContaBancoMT;

implementation

{$R *.DFM}

end.
