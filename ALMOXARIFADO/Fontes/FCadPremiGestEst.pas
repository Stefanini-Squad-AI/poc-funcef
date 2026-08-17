unit FCadPremiGestEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, TREdit, CmEventosCadastro, ImgList;

type
  TFrmCadPremiGestEst = class(TfrmCadastroCS)
    GrpArt: TGroupBox;
    qryArtigo: TwwQuery;
    dblcItem: TwwDBLookupCombo;
    dblcDesc: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edAlmox: TEdit;
    pln: TPanel;
    qryCODARTIGO: TStringField;
    qryCODALMOXARIFADO: TFloatField;
    qryPERIODOCOMPRA: TFloatField;
    qryPTORESUSADO: TFloatField;
    qryTEMRESUSADO: TFloatField;
    qryCONMEDUSADO: TFloatField;
    qryESTMINUSADO: TFloatField;
    qryESTMAXIMO: TFloatField;
    qryIDPESSOA: TFloatField;
    edTmpRessupMed: TDBRealEdit;
    edQtdeMin: TDBRealEdit;
    edPontoRepos: TDBRealEdit;
    edConsMed: TDBRealEdit;
    edQtdeMax: TDBRealEdit;
    edIntervalRessup: TDBRealEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    Procedure Sel( sCodArt : String );
  public
    { Public declarations }
  end;

var
  FrmCadPremiGestEst: TFrmCadPremiGestEst;

implementation

{$R *.DFM}

Uses  uSistema, uModulo;

Procedure TFrmCadPremiGestEst.Sel( sCodArt : String );
Begin
    qry.Close;
    qry.ParamByName('pCODART').Value   := sCodArt;
    qry.ParamByName('pCODALMOX').Value := Modulo.iCodAlmoxa;
    qry.ParamByName('pIDPESS').Value   := Sistema.IdEmpresa;
    qry.Open;
    dblcItem.LookupValue := sCodArt;
    dblcDesc.LookupValue := sCodArt;
End;

procedure TFrmCadPremiGestEst.FormCreate(Sender: TObject);
begin
  inherited;
  EdAlmox.Text := Modulo.sAlmoxaUsuario;
  Sel('');
  //
  MontaSelect.Filtro.Add('SALDO.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa) );
  MontaSelect.Filtro.Add('SALDO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa) );
end;

Procedure TFrmCadPremiGestEst.CmeCadastroEdit(Sender: TObject);
Begin
     inherited;
     edTmpRessupMed.SetFocus;
End;

Procedure TFrmCadPremiGestEst.CmeCadastroFind(Sender: TObject);
Begin
     inherited;
     If MontaSelect.RetornouValor Then
        Begin
             Sel( TRIM(MontaSelect.ValoresChave[0]) );
        End;
End;

end.
