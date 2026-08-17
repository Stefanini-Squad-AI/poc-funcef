unit FMTCadTermo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, DBCtrls, ExtCtrls, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  uCtrlTermoInventario, uCmTypes;

type
  TFrmMTCadTermo = class(TFrmCadastroMT)
    RagTermo: TDBRadioGroup;
    memTexto: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    TermoInventario : TCtrlTermoInventario;
    //
    Procedure Sel( sTipo : String );
  public
    { Public declarations }
  end;

var
  FrmMTCadTermo: TFrmMTCadTermo;

implementation

{$R *.DFM}

Uses DBaseDados, uSistema, uMensErro;

procedure TFrmMTCadTermo.FormCreate(Sender: TObject);
begin
  inherited;
  TermoInventario := TCtrlTermoInventario.Create;
  TermoInventario.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  TermoInventario.cds := cds;
  sel('');
end;

procedure TFrmMTCadTermo.Sel(sTipo: String);
begin
   cds.Data := TermoInventario.GetTermoInventario(Sistema.IdEmpresa, sTipo );
end;

procedure TFrmMTCadTermo.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.FieldByName('FLGABREFECHA').asString := 'A';
  cds.FieldByName('IDPESSOA').asInteger    := Sistema.IdEmpresa;
  memTexto.SetFocus;
end;

procedure TFrmMTCadTermo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  memTexto.SetFocus;
end;

procedure TFrmMTCadTermo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If MontaSelect.RetornouValor Then
      Sel(MontaSelect.ValoresChave[1]);
end;

procedure TFrmMTCadTermo.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   Accept := True;
    If Trim(memTexto.Text) = ''  Then
       Begin
          MsgDlg('Texto não preenchido','Erro',mtError,[mbOK],0);
          memTexto.SetFocus;
          Accept := False;
       End;
end;

procedure TFrmMTCadTermo.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TermoInventario.AplicaOperacao;
end;

procedure TFrmMTCadTermo.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TermoInventario.AplicaOperacao;
end;

procedure TFrmMTCadTermo.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TermoInventario.AplicaOperacao;
end;

procedure TFrmMTCadTermo.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
  Sel(cds.FieldByName('FLGABREFECHA').AsString);
end;

procedure TFrmMTCadTermo.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(TermoInventario.MessageInfo,'Erro',mtError,[mbOk],0);
end;

end.
