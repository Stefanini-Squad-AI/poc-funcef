unit fCadOSMan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdblook, CMProcura,  Spin, wwdbdatetimepicker,
  CMDateTimePicker, CMDBLookupCombo, CmEventosCadastro, ImgList, TREdit;

type
  TfrmCadOSMan = class(TfrmCadMestreDetalheCS)
    qryIDORDEMSERVICO: TFloatField;
    qryIDBEM: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDUSUARIOSOLI: TFloatField;
    qryFLGTIPOMANUT: TStringField;
    qryDATAOS: TDateTimeField;
    qryOBSOS: TStringField;
    qryBem: TwwQuery;
    QryUsuSist: TwwQuery;
    Label8: TLabel;
    Label2: TLabel;
    dblcUsuario: TCMDBLookupCombo;
    RgDispon: TDBRadioGroup;
    Label3: TLabel;
    Label11: TLabel;
    edDataCad: TCMDateTimePicker;
    qryServMan: TwwQuery;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    StaticText1: TStaticText;
    dblcOpManut: TCMDBLookupCombo;
    qryOpeManut: TwwQuery;
    qryOpeManutIDOPERADORMANUT: TFloatField;
    qryOpeManutNOME: TStringField;
    Label9: TLabel;
    StaticText2: TStaticText;
    dblcServManut: TCMDBLookupCombo;
    Label4: TLabel;
    DBMemObserv: TDBMemo;
    DBMemServOb: TDBMemo;
    qryServManIDSERVICOMANUT: TFloatField;
    qryServManDESCSERVICO: TStringField;
    qryServManPRIORIDADE: TFloatField;
    Label1: TLabel;
    edOS: TDBEdit;
    qryDetIDORDEMSERVICO: TFloatField;
    qryDetIDSERVICOMANUT: TFloatField;
    qryDetIDOPERADORMANUT: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetPRIORIDADE: TFloatField;
    qryDetOBSSERVICOOS: TStringField;
    qryDetDESCSERVICO: TStringField;
    qryDetNOME: TStringField;
    qryBemPRIORIDADE: TFloatField;
    MsBem: TMontaSelect;
    CMProcBem: TCMProcura;
    qryDetDATAMANUTENCAO: TDateTimeField;
    edPriorid: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblcServManutCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    procedure SelMestreDet(n: double);
    function  VerifExec: boolean;
    function  VerifServico: boolean;
  end;

var
  frmCadOSMan: TfrmCadOSMan;
  bInsert: boolean;

implementation

uses {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
  uMensErro, uDataBase, uSistema, uModulo, dBaseDados, UsoGeralRH;

{$R *.DFM}

Function TfrmCadOSMan.VerifExec : Boolean;
Begin
   Result := False;
   qryDet.DisableControls;
   Try
     qryDet.First;
     While Not qryDet.Eof Do
        Begin
           Result := Not qryDetDATAMANUTENCAO.IsNull;
           if Result Then
              Break;
           qryDet.Next;
        End;
   Finally
     qryDet.EnableControls;
   End;
End;

Procedure TfrmCadOSMan.SelMestreDet( n : Double );
Begin
    qry.Close;
    qry.Params[0].Value := n;
    qry.Open;
    //
    qryDet.Close;
    qryDet.Params[0].Value := n;
    qryDet.Open;
    //
    QryBem.Close;
    QryBem.Params[0].asFloat := qry.FieldByName('IDBEM').asFloat;
    QryBem.Open;
End;

procedure TfrmCadOSMan.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('ORDEMSERVICOMANUT.IDPESSOA ='+IntToStr(Sistema.idEmpresa));
  MontaSelect.Filtro.Add('BEM.IDPESSOA ='+IntToStr(Sistema.idEmpresa));
  if sUsoGeralIdPessoa <> '' then
     MontaSelect.Filtro.Add('ORDEMSERVICOMANUT.IDUSUARIOSOLI = '+ sUsoGeralIdPessoa);
  if sUsuXccusto <> '' then
     MontaSelect.Filtro.Add('ORDEMSERVICOMANUT.IDUSUARIOSOLI IN (SELECT IDPESSOA '+
                            'FROM FUNCIONARIO WHERE IDEMPRESA = '+
                            IntToStr(Sistema.idEmpresa) + ' AND CODCENTROCUSTO IN '+
                            sUsuXccusto+ ')');
  if sUsuXfilial <> '' then
     MontaSelect.Filtro.Add('ORDEMSERVICOMANUT.IDUSUARIOSOLI IN (SELECT IDPESSOA '+
                            'FROM FUNCIONARIO WHERE IDESTAB IN '+ sUsuXfilial + ')');

  //
  MSBem.Filtro.Add('BEM.IDPESSOA ='+IntToStr(Sistema.idEmpresa));
  //
  qryOpeManut.Close;
  qryOpeManut.Params[0].Value := Sistema.IdEmpresa;
  qryOpeManut.Open;
  //
  qryBem.Close;
  qryBem.Params[0].Value := Sistema.IdEmpresa;
  qryBem.Open;
  //
  qryUsuSist.Sql.Clear;
  qryUsuSist.Sql.Add('SELECT IDUSUARIO, NOMEUSUARIO FROM USUARIOSISTEMA ');
  if (sUsuXccusto <> '') or (sUsoGeralIdPessoa <> '') then
     if (sUsuXccusto <> '') then
        qryUsuSist.Sql.Add('WHERE IDUSUARIO IN (SELECT IDPESSOA '+
                            'FROM FUNCIONARIO WHERE IDEMPRESA = '+
                            IntToStr(Sistema.idEmpresa) + ' AND CODCENTROCUSTO IN '+
                            sUsuXccusto+ ')')
     else
        qryUsuSist.Sql.Add('WHERE IDUSUARIO = ' + sUsoGeralIdPessoa);

  qryUsuSist.Sql.Add('ORDER BY UPPER(NOMEUSUARIO)');
  qryUsuSist.Open;


  //
  qryServMan.Open;
  //
  SelMestreDet(-1);
end;

Procedure TfrmCadOSMan.CmeCadastroInsert(Sender: TObject);
Begin
   bInsert := True;
   SelMestreDet(-1);
   Inherited;
   qry.FieldByName('DATAOS').asDateTime := Date;
   qry.FieldByName('FLGTIPOMANUT').asString := 'C';
   CMProcBem.SetFocus;
End;

Procedure TfrmCadOSMan.CmeCadastroEdit(Sender: TObject);
Begin
   bInsert := False;
   If VerifExec Then
      Begin
         MsgDlg('ja foram Executados serviços para esta O.S. .Proibida Alteração','Erro',mtError,[mbOK],0);
         bbtnCancelar.Click;
      End
   Else
     Begin
        Inherited;
        CMProcBem.SetFocus;
     End;
End;

Procedure TfrmCadOSMan.CmeCadastroDelete(Sender: TObject);
Begin
   If VerifExec Then
      Begin
         MsgDlg('ja foram Executados serviços para esta O.S. .Proibida Exclusão','Erro',mtError,[mbOK],0);
      End
   Else
     Begin
        qryDet.First;
        While Not qryDet.Eof Do
           Begin
               qryDet.Delete;
           End;
        Inherited;
     End;   
End;

Procedure TfrmCadOSMan.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
   If MontaSelect.RetornouValor Then
      Begin
          SelMestreDet(StrToFloat(MontaSelect.ValoresChave[0]));
      End;
End;

Procedure TFrmCadOSMan.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    If Trim(dblcUsuario.Text) = '' Then
       Begin
           MsgDlg('Usuário Solicitante não foi preenchido','Erro',mtError,[mbOK],0);
           dblcUsuario.SetFocus;
           Accept := False;
       End
   Else
   If CMProcBem.Valida <> VcOK Then
      Begin
         CMProcBem.SetFocus;
         Accept := False;
      End
   Else
   If Trim(edDataCad.Text) = '' Then
       Begin
           MsgDlg('Data de Cadastro não foi preenchido','Erro',mtError,[mbOK],0);
           edDataCad.SetFocus;
           Accept := False;
       End
     Else
   If qryDet.IsEmpty Then
       Begin
           MsgDlg('Não há serviço cadastrado','Erro',mtError,[mbOK],0);
           Accept := False;
       End;
End;

Procedure TfrmCadOSMan.CmeCadastroConfirma(Sender: TObject);
Begin
    With qry Do
       Begin
        if State in [dsInsert,dsEdit] Then
           Begin
               If State = dsInsert Then
                   FieldByName('IDORDEMSERVICO').asInteger := LeUltRegistro(nil,'ORDEMSERVICOMANUT');
               FieldByName('IDPESSOA').asInteger           := Sistema.IdEmpresa;
               // Tras a prioridade do bem
               QryBem.Close;
               QryBem.Params[0].asFloat := qry.FieldByName('IDBEM').asFloat;
               QryBem.Open;
               //
               qryDet.First;
               While Not qryDet.Eof Do
                 Begin
                    qryDet.Edit;
                    qryDet.FieldByName('IDORDEMSERVICO').asInteger := qry.FieldByName('IDORDEMSERVICO').asInteger;
                    if qryDet.FieldByName('PRIORIDADE').asInteger = 0 then
                       Begin
                          qryServMan.Locate('IDSERVICOMANUT',qryDet.FieldByName('IDSERVICOMANUT').asString,[]);
                          If qryServMan.FieldByName('PRIORIDADE').IsNull OR qryBem.FieldByName('PRIORIDADE').IsNull Then
                              qryDet.FieldByName('PRIORIDADE').asInteger := 0
                          Else
                              qryDet.FieldByName('PRIORIDADE').asInteger := qryServMan.FieldByName('PRIORIDADE').asInteger * qryBem.FieldByName('PRIORIDADE').asInteger;
                       End;
                    qryDet.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
                    qryDet.Next;
                 End;
              AplicaAlteracoes([qry,qrydet]);
              MsgDlg('Nº O.S. '+qry.FieldByName('IDORDEMSERVICO').AsString,'Informação',mtInformation,[mbOk],0);
              if bInsert Then
                SelMestreDet(-1);
           End
       else
           AplicaAlteracoes([qrydet,qry]);
     End;
    inherited;
End;

Procedure TfrmCadOSMan.CmeDetalheInsert(Sender: TObject);
Begin
   inherited;
   dblcServManut.SetFocus
End;

Procedure TfrmCadOSMan.CmeDetalheEdit(Sender: TObject);
Begin
   inherited;
   dblcServManut.SetFocus
End;

Procedure TfrmCadOSMan.CmeDetalheDelete(Sender: TObject);
Begin
      If MsgDlg('Confirma a exclusão do Serviço na OS','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
         inherited;
End;

Procedure TfrmCadOSMan.CmeDetalheConfirma(Sender: TObject);
Begin
 If (qryDet.State in [dsInsert,dsEdit]) Then
   Begin
      If trim(dblcServManut.Text) = '' Then
         Begin
             MsgDlg('Serviço de Manutenção não foi preenchido','Erro',mtError,[mbOK],0);
             dblcServManut.SetFocus;
         End
      Else
      If edPriorid.Value > 100 Then
         Begin
             MsgDlg('Prioridade não pode ser maior que 100','Erro',mtError,[mbOK],0);
             edPriorid.SetFocus;
         End
      Else
      If VerifServico Then
         Begin
             MsgDlg('Já existe O.S. com esse serviço para '+CMProcBem.Text,'Erro',mtError,[mbOK],0);
             dblcServManut.SetFocus;
         End

      Else
         Begin
            qryDet.FieldByName('IDPESSOA').asInteger       := Sistema.IdEmpresa;
            qryDet.FieldByName('DESCSERVICO').asString     := dblcServManut.Text;
            qryDet.FieldByName('NOME').asString            := dblcOpManut.Text;
            Inherited;
         End;
   End
 Else
   inherited;
End;

procedure TfrmCadOSMan.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  SelMestreDet(-1);
end;


procedure TfrmCadOSMan.dblcServManutCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcServManut.Text) <> '' Then
     Begin
        if qryServMan.FieldByName('PRIORIDADE').IsNull OR qryBem.FieldByName('PRIORIDADE').IsNull Then
            qryDet.FieldByName('PRIORIDADE').asInteger := 0
        Else
            qryDet.FieldByName('PRIORIDADE').asInteger := qryServMan.FieldByName('PRIORIDADE').asInteger * qryBem.FieldByName('PRIORIDADE').asInteger;
     End;
end;

function TfrmCadOSMan.VerifServico: Boolean;
Var
   SQL : String;
begin
   SQL := 'SELECT '+
          '     SE.IDORDEMSERVICO '+
          'FROM '+
          '     SERVICOSXOS SE, '+
          '     ORDEMSERVICOMANUT OS '+
          'WHERE '+
          '        (OS.IDBEM = '+CMProcBem.MontaSelect.ValoresChave[0]+') '+
          '   AND  (DATAMANUTENCAO IS NULL) '+
          '   AND  (SE.IDSERVICOMANUT = '+dblcServManut.LookupValue+') '+
          '   AND  (SE.IDORDEMSERVICO = SE.IDORDEMSERVICO) ';
   Result := FazQuery(DtmBaseDados.qry,SQL);
ENd;

end.
