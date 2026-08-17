unit FParamCompras;

interface

uses                                                                  
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, DBCtrls, TREdit, wwdblook, CmEventosCadastro, ImgList;

type
  TFrmParamCompras = class(TfrmCadastroCS)
    qryIDPESSOA: TFloatField;
    qryTXJUROS: TFloatField;
    qryPESOPRECO: TFloatField;
    qryPESOPRAZOENT: TFloatField;
    qryPESOPRAZOPGTO: TFloatField;
    qryPESOAVALIACAO: TFloatField;
    qryCOMPRARALEMSC: TFloatField;
    qryNUMAVALIACOES: TFloatField;
    qryINSTRUCAOOC: TMemoField;
    qryIMPOBSAPARTE: TFloatField;
    qryASSINATURA1: TStringField;
    qryASSINATURA2: TStringField;
    qryASSINATURA3: TStringField;
    qryIMPLOGO: TStringField;
    qryTRASOBS: TStringField;
    qryFLGORCAMENTO: TStringField;
    GrpOC: TGroupBox;
    Label1: TLabel;
    edAssinat1: TDBEdit;
    edAssinat2: TDBEdit;
    edAssinat3: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    memObs: TDBMemo;
    Label4: TLabel;
    chkImpAparte: TDBCheckBox;
    chkOrcamento: TDBCheckBox;
    chkCompraAlem: TDBCheckBox;
    chkImpLogo: TDBCheckBox;
    chkTrasObs: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edPreco: TDBRealEdit;
    edPrazoEnt: TDBRealEdit;
    edAvaliForn: TDBRealEdit;
    edPrazoPag: TDBRealEdit;
    edTaxaJur: TDBRealEdit;
    chkOBSCIOC: TDBCheckBox;
    qryFLGOBSSCIOC: TStringField;
    qryCODTIPDOC: TFloatField;
    qryTipoDoc: TwwQuery;
    Label10: TLabel;
    dbclTipoDocumento: TwwDBLookupCombo;
    RgImOC: TDBRadioGroup;
    qryMODELOIMPOC: TFloatField;
    chkVerifRAD: TDBCheckBox;
    qryFLGVERIFRAD: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamCompras: TFrmParamCompras;

implementation

{$R *.DFM}
Uses uSistema, uModulo, dBaseDados;

procedure TFrmParamCompras.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   If (Not qry.IsEmpty) Then
     Begin
        qry.Cancel;
        qry.Edit;
     End;
   qryIDPESSOA.AsInteger := Sistema.IdEmpresa;     
End;


procedure TFrmParamCompras.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
  Modulo.AtualizarParametros( Sistema.idEmpresa );
end;

procedure TFrmParamCompras.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.Params[0].Value := Sistema.idEmpresa;
  qry.Open;
end;

end.
