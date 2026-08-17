unit FCadTalaoChequeMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, Mask, wwdbedit, TREdit, CmEventosCadastro, ImgList,
  FCadastroMT, DBClient, uCMClientDataSet, uCtrlcheques, uCtrlPortadorConta,
  {$IFDEF VER0505} uComun {$ELSE} uCMTypes{$ENDIF};

type
  TFrmCadTalaoChequeMT = class(TfrmCadastroMT)
    lblPortadorConta: TLabel;
    dblkcmbPortadorContar: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    EdtNumTalao: TDBRealEdit;
    EdtProxCheque: TDBRealEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EdtCqInicial: TDBRealEdit;
    EdtCqFinal: TDBRealEdit;
    CdsTestaFaixa: TCMClientDataSet;
    CdsPortadorConta: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Ctrlcheques : TCtrlcheques;
    CtrlPortadorConta : TCtrlPortadorConta;
  public
    { Public declarations }
  end;

var
  FrmCadTalaoChequeMT: TFrmCadTalaoChequeMT;

implementation

{$R *.DFM}

Uses uSistema, uMenserro, uFuncaoGeral, DBaseDados, uCtrlParamIntegra;

procedure TFrmCadTalaoChequeMT.FormCreate(Sender: TObject);
begin
  inherited;
  Ctrlcheques := TCtrlcheques.create;
  Ctrlcheques.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  Ctrlcheques.cds := cds;
  Cds.data := Ctrlcheques.Listcheques( -1 );
  CdsTestaFaixa.data := Ctrlcheques.ListChequesPortadorConta ( 0, 0, 0,0,0, 0 );

  CtrlPortadorConta := TCtrlPortadorConta.create;
  CtrlPortadorConta.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CdsPortadorConta.data := CtrlPortadorConta.ListPortadorconta(0, ParamIntegra.RecPag, Sistema.IdEmpresa );
  MontaSelect.Filtro.Add('PORTADORCONTA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30062;
    bbtnAjuda.HelpContext := 30062;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;

Procedure TFrmCadTalaoChequeMT.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Var
  X: Integer;
begin
  For X:=0 To Cds.FieldCount - 1 Do
     If (Cds.Fields[x].Tag = 1) And (Cds.Fields[x].IsNull) Then
     Begin
        MsgDlg( Cds.Fields[x].DisPlayLabel + ' não foi informado','Aviso',mtError,[mbOk],0);
        Accept := False;
        Exit;
      End;

  Accept := (Cds.fieldbyname('NUMCHEQUEINICIAL').AsFloat < Cds.fieldbyname('NUMCHEQUEFINAL').AsFloat);
  If Accept Then
  Begin
     Accept := ((Cds.fieldbyname('NUMCHEQUEINICIAL').AsFloat <=
                 Cds.fieldbyname('NUMPROXIMOCHEQUE').AsFloat) OR
                 (Cds.fieldbyname('NUMPROXIMOCHEQUE').AsFloat = 0));
     If Accept Then
     Begin
        CdsTestaFaixa.data := Ctrlcheques.ListChequesPortadorConta (Sistema.IdEmpresa,
            Cds.fieldbyname('IDCHEQUES').AsFloat, StrToInt(dblkcmbPortadorContar.LookupValue),
            Cds.fieldbyname('NUMTALAO').AsFloat, Cds.fieldbyname('NUMCHEQUEINICIAL').AsFloat,
            Cds.fieldbyname('NUMCHEQUEFINAL').AsFloat) ;

       If Not CdsTestaFaixa.IsEmpty Then
       Begin
          Accept := False;
          If CdsTestaFaixa.fieldbyname('NUMTALAO').AsFloat = Cds.fieldbyname('NUMTALAO').AsFloat Then
             MsgDlg('O Número do talão já cadastrado para esta conta ','Erro',mtError,[mbOk],0)
          Else
            If (CdsTestaFaixa.fieldbyname('NUMCHEQUEINICIAL').AsFloat <= Cds.fieldbyname('NUMCHEQUEINICIAL').AsFloat) And
               (CdsTestaFaixa.fieldbyname('NUMCHEQUEFINAL').AsFloat >= Cds.fieldbyname('NUMCHEQUEINICIAL').AsFloat)   Then
               MsgDlg('O Número do cheque incial partence a outro talão cadastrado para esta conta ','Erro',mtError,[mbOk],0)
            Else
               MsgDlg('O Número do cheque final partence a outro talão cadastrado para esta conta ','Erro',mtError,[mbOk],0);
       End;
     End
     Else
        MsgDlg('O Número do primeiro cheque não pode ser maior que o próximo cheque ','Erro',mtError,[mbOk],0);
  End
  Else
     MsgDlg('O Número do primeiro cheque tem de ser menor que o do último ','Erro',mtError,[mbOk],0);
end;

procedure TFrmCadTalaoChequeMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
  Begin
     Cds.data := Ctrlcheques.Listcheques(StrToInt(MontaSelect.ValoresChave[0]));
     sbtnAlterar.Enabled :=  (Cds.fieldbyname('NUMPROXIMOCHEQUE').AsFloat <= Cds.fieldbyname('NUMCHEQUEFINAL').AsFloat);
  End;
End;

procedure TFrmCadTalaoChequeMT.sbtnAlterarClick(Sender: TObject);
begin
  If(Not Cds.IsEmpty) And
    (Cds.fieldbyname('NUMPROXIMOCHEQUE').AsFloat > Cds.fieldbyname('NUMCHEQUEFINAL').AsFloat) Then
     MsgDlg('O talão já foi fechado, não é possível alterar ','Erro',mtError,[mbOk],0)
  Else
    inherited;
end;

procedure TFrmCadTalaoChequeMT.sbtnApagarClick(Sender: TObject);
begin
  If(Not Cds.IsEmpty) And
    (Cds.fieldbyname('NUMPROXIMOCHEQUE').AsFloat > Cds.fieldbyname('NUMCHEQUEFINAL').AsFloat) Then
     MsgDlg('O talão já foi fechado, não é possível excluir ','Erro',mtError,[mbOk],0)
  Else
    inherited;
end;

procedure TFrmCadTalaoChequeMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := Ctrlcheques.Gravarcheques;
end;

procedure TFrmCadTalaoChequeMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := Ctrlcheques.Gravarcheques;
end;

procedure TFrmCadTalaoChequeMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := Ctrlcheques.Gravarcheques;
end;

procedure TFrmCadTalaoChequeMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If Ctrlcheques.MessageInfo <> '' Then
     MsgDlg(Ctrlcheques.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmCadTalaoChequeMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
Cds.fieldbyname('NUMPROXIMOCHEQUE').AsFloat := Cds.fieldbyname('NUMCHEQUEINICIAL').AsFloat;
end;

end.
