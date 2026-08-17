unit FRequiscao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TB97, TabControlDetalhe, ExtCtrls,  Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, TREdit, DBCtrls, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  CmEventosCadastro, ImgList;

type
  TFrmRequisicao = class(TfrmCadMestreDetalheCS)
    rgTipMov: TRadioGroup;
    grpAlmoxCC: TGroupBox;
    dblcAlmox: TwwDBLookupCombo;
    dblcCCust: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    grpReq: TGroupBox;
    edDataReq: TCMDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edQtde: TRealEdit;
    dblcUN: TwwDBLookupCombo;
    Label7: TLabel;
    Label8: TLabel;
    DbUN: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dblcDesc: TwwDBLookupCombo;
    qryCombo: TwwQuery;
    qryDet: TwwQuery;
    qryUnidMed: TwwQuery;
    qrySaldo: TwwQuery;
    dblcItem: TwwDBLookupCombo;
    qryAux: TwwQuery;
    dsAux: TwwDataSource;
    dsSaldo: TwwDataSource;
    Label12: TLabel;
    lbAlmox: TStaticText;
    Label13: TLabel;
    Label14: TLabel;
    qryAuxCODARTIGO: TStringField;
    qryAuxSALDOQTDE: TFloatField;
    qryCustMed: TwwQuery;
    qryAlmox: TwwQuery;
    qryCCust: TwwQuery;
    qryTransf: TwwQuery;
    UpdDet: TUpdateSQL;
    edNumReq: TRealEdit;
    edValb: TRealEdit;
    DbSaldoQtde: TRealEdit;
    qryDetIDMOV: TFloatField;
    qryDetCODARTIGO: TStringField;
    qryDetCODALMOXARIFADO: TFloatField;
    qryDetCODCENTROCUSTO: TStringField;
    qryDetDATAMOV: TDateTimeField;
    qryDetQTDEMOV: TFloatField;
    qryDetVALORMOV: TFloatField;
    qryDetDESCRICAO: TStringField;
    qryDetUn: TStringField;
    qryDetFLGDEST: TStringField;
    qryFichaTec: TwwQuery;
    qryFichaTecCODARTIGOSEC: TStringField;
    qryFichaTecQTDE: TFloatField;
    qryFichaTecCODMEDIDA: TStringField;
    rgDest: TRadioGroup;
    qryUnidNegoc: TwwQuery;
    Label3: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edQtdeExit(Sender: TObject);
    procedure dblcUNExit(Sender: TObject);
    procedure rgTipMovClick(Sender: TObject);
    procedure dblcAlmoxExit(Sender: TObject);
    procedure qryDetCalcFields(DataSet: TDataSet);
    procedure edDataReqExit(Sender: TObject);
    procedure dblcAlmoxCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
 private
    { Private declarations }
    Function SelCusto (S : String ):Double;
    Procedure Sel(S : String );
    Function SelTransf(S : String ) : Boolean;
    Procedure LimpaDet;
    Procedure Limpar;
    Procedure SelTipoMov;
    Procedure FazOPeracao( sCodArt,sUnid : String; rValor,rQtde : Double );
    Procedure SelUnid( S : String );
    Function  VerifDados( d : TDateTime ) : Boolean;
    Function  ExisteReq( sNumDoc,sCodArt : String ) : Boolean;
  public
    { Public declarations }
  end;

var
  FrmRequisicao : TFrmRequisicao;
  rQtde         : Double;
  rValor        : Double;
  TipoMovEnt    : Char;
  TipoMovSai    : Char;
  bTranf        : Boolean;
  sAlmoxOrigem  : String[01];
  sAlmoxDestino : String[01];
  sCCustoOrigem : String;
  sCCustoDestino: String;
  iCodCusteio   : Integer;
  bInsert       : Boolean;

implementation

{$R *.DFM}
Uses uModulo,UString,uSistema,UConversaoMed, uMensErro,
     uMovNew,uDataBase,uFuncaoGeral, dBaseDados;

procedure TFrmRequisicao.SelUnid(S : String );
Begin
//
 qryUnidMed.Open;
 qryUnidMed.Sql.Text:= ' Select U.CodMedida, ' +
                       '        U.DescMedida ' +
                       ' From   UnMedida U,  ' +
                       '        Conver   C   ' +
                       ' Where  (RTRIM(C.CodProduto) = ''' + Copy(S,1,6) + ''') And' +
                       '        (U.CodMedida  = C.CodMedida) ' +
                       ' Order By CodMedida ';
 qryUnidMed.Open;

End;

procedure TFrmRequisicao.Sel(S : String );
Begin
//
{ qryAux.Open;
 qryAux.Sql.Text:= ' Select CodArtigo, SaldoQtde '+
                   ' From Saldo  '+
                   ' Where  (RTRIM(CodArtigo) = '''+ S + ''') And ' +
                   '        (CodAlmoxarifado = ' + IntToStr(Modulo.iCodAlmoxa )+ ') And '+
                   '        (idPessoa  = ' + IntToStr(Sistema.IdEmpresa)+')';
 qryAux.Open;
 DbSaldoQtde.Value := qryAux.FieldByName('SaldoQtde').AsFloat; }
 DbSaldoQtde.Value := MovNew.InfoSaldo(Trim(s),Modulo.iCodAlmoxa,edDataReq.Date );
End;

procedure TFrmRequisicao.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.Sql.Text := ' Select CodAlmoxarifado, PRINCIPSECUND,CODCENTROCUSTO From Almox ' +
                       ' Where  (CodAlmoxarifado = ' + IntToStr( Modulo.icodAlmoxa )+')';
  qryAlmox.Open;
  //
  sAlmoxOrigem  := qryAlmox.FieldbyName('PRINCIPSECUND').AsString;
  sCCustoDestino:= qryAlmox.FieldbyName('CODCENTROCUSTO').AsString;
  lbAlmox.Caption := '  ' + Modulo.sAlmoxaUsuario + '  ';
  //
  qryUnidMed.Open;
  qryAux.Open;
  qry.Open;
  //
  qryDet.Close;
  qryDet.Params[0].AsInteger := 0;
  qryDet.Open;
  //
  qryCCust.Close;
  qryCCust.SQL.Text:=' SELECT CODCENTROCUSTO,NOME FROM CENTCUST '+
                     ' WHERE (STATUSGRUPOCDC = ''A'') '+
                     '   AND (ATIVO =''S'') '+
                     '   AND (IDEMPRESA = '+IntToStr(Sistema.Idempresa)+')'+
                     ' ORDER BY NOME';
  qryCCust.Open;
  //
  qryAlmox.Close;
  qryAlmox.Sql.Text := ' Select A.CodAlmoxarifado, A.DescAlmox,A.PRINCIPSECUND, A.CodCentroCusto, A.CodCusteio From Almox A,TransfAlmox T'+
                       ' Where (A.CodAlmoxarifado <> ' + IntToStr(Modulo.icodAlmoxa ) + ') and (A.idpessoa =  ' +IntToStr(Sistema.IdEmpresa)+')'+
                       ' and (t.codalmoxarifado = '+ IntToStr(Modulo.icodAlmoxa )+') AND (A.CODALMOXARIFADO = T.CODALMOXPERMITE)'+
                       ' Order By A.DescAlmox ';
  qryAlmox.Open;
  //
  qryUnidNegoc.Close;
  qryUnidNegoc.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryUnidNegoc.Open;
end;

procedure TFrmRequisicao.CmeCadastroInsert(Sender: TObject);
Begin
  inherited;
  pnlMestre.Enabled := True;
  Limpar;
  EdDataReq.Date := Date;
  RgTipMov.ItemIndex := 0;
  RgTipMov.SetFocus;

End;

Procedure TFrmRequisicao.CmeDetalheInsert(Sender: TObject);
Begin
    inherited;
    bInsert := True;
    LimpaDet;
    qryDet.FieldByName('FLGDEST').asString := 'I';
    RgDest.ItemIndex := 0;
    dblcItem.SetFocus;
End;

Procedure TFrmRequisicao.CmeDetalheEdit(Sender: TObject);
Begin
    dblcItem.Text        := qryDet.FieldByName('CodArtigo').AsString;
    dblcDesc.LookUpValue := qryDet.FieldByName('CodArtigo').AsString;
    dblcDesc.CloseUp( True );
    dblcUn.Text  := qryDetUn.AsString;
    edQtde.Value := qryDet.FieldByName('QtdeMov').AsFloat;
    edValB.Value := qryDet.FieldByName('ValorMov').AsFloat;
    bInsert      := False;
    Sel( espaco(qryDet.FieldByName('CodArtigo').AsString,14) );
    dblcItem.SetFocus;
    inherited;
End;
procedure TFrmRequisicao.CmeDetalheDelete(Sender: TObject);
Begin
    If MsgDlg('Confirma a exclusão do item','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
      QryDet.Delete;
  // inherited;
End;

procedure TFrmRequisicao.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcDesc.Text) <> '' Then
     Begin
        dblcItem.LookUpValue := dblcDesc.LookUpValue;
        Sel( espaco(dblcDesc.LookUpValue,14) );
        SelUnid(dblcDesc.LookUpValue );
     End;
end;

procedure TFrmRequisicao.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Trim(dblcItem.Text) <> '' Then
    Begin
       dblcDesc.LookUpValue := dblcItem.LookUpValue;
       Sel(espaco(dblcItem.LookUpValue,14) );
       SelUnid(dblcItem.LookUpValue );
    End;
end;

procedure TFrmRequisicao.edQtdeExit(Sender: TObject);
begin
  inherited;
  //
  rQtde := ConversaoMed.ConverteSaldoQtde(dblcItem.LookUpValue,
                                          dblcUn.LookUpValue,
                                          dbUn.Text,
                                          edQtde.Value);
  If (rgTipMov.ItemIndex <> 2) And ( RgDest.ItemIndex <> 1) Then
    Begin
       If Format('%17.5f',[rQtde]) > Format('%17.5f',[dbSaldoQtde.Value]) Then
          Begin
             MsgDlg('Quantidade solicitado maior que a quantidade disponível','Erro',mtError,[mbOk],0);
             edQtde.Clear;
             edQtde.SetFocus;
             Exit;
         End;
     End;
  edValB.Value :=  SelCusto(dblcItem.LookUpValue);
end;

Function TFrmRequisicao.SelCusto (S : String ):Double;
Begin
  //
  qryCustMed.Close;
  qryCustMed.SQL.Text := ' Select CustoMedio ' +
                         ' From CustoMed ' +
                         ' Where (CodArtigo = '''+ S + ''' ) ' +
                         '   And (CodCusteio = ' + IntToStr(Modulo.iCodCusteio)+')';
  qryCustMed.Open;
  SelCusto := qryCustMed.FieldByName('CustoMedio').AsFloat * rQtde;
End;

Function TFrmRequisicao.SelTransf (S : String ) : Boolean;
Begin
  //
  SelTransf := True;
  qryTransf.Close;
  qryTransf.SQL.Text := ' Select CODALMOXARIFADO ' +
                        ' From TransfAlmox ' +
                        ' Where (CODALMOXARIFADO = '+ IntToStr( Modulo.iCodAlmoxa ) + ') And ' +
                        ' (CODALMOXPERMITE = '+ Trim(S) + ') ';
  qryTransf.Open;
  If qryTransf.isEmpty Then
     SelTransf := False;
End;

procedure TFrmRequisicao.dblcUNExit(Sender: TObject);
begin
  inherited;
  IF (qryDet.State in dsEditModes) And (dblcUN.Text = '') Then
    Begin
        MsgDlg('Selecione uma unidade de medida','Erro',mtError,[mbOk],0);
        dblcUN.SetFocus;
    End;
end;

Procedure TFrmRequisicao.CmeDetalheConfirma(Sender: TObject);
Begin
     If qry.State In [dsInsert,dsEdit] then
       Begin
          If trim(dblcCCust.LookUpValue) <> '' Then
             Begin
                If (Modulo.sIntegraContab = 'S') And (Not Modulo.Verifcc(dblcItem.LookUpValue,dblcCCust.LookUpValue,Sistema.IdEmpresa)) Then
                   Begin
                       MsgDlg('Este Centro de Custo não pode requisitar este produto','Erro',mtError,[mbOk],0);
                       FuncaoGeral.TiraIcone;
                       dblcItem.SetFocus;
                       Exit;
                   End;
             End
          Else
             Begin
                If (Modulo.sIntegraContab = 'S') And (Not Modulo.Verifcc(dblcItem.LookUpValue,sCCustoOrigem,Sistema.IdEmpresa)) Then
                  Begin
                      MsgDlg('Este Almoxarifado não pode requisitar este produto','Erro',mtError,[mbOk],0);
                      FuncaoGeral.TiraIcone;
                      dblcItem.SetFocus;
                      Exit;
                  End;
             End;
              qryDet.Cancel;
              If  (qryDet.State = dsInsert) And (qryDet.Locate('CodArtigo',Espaco(dblcItem.LookupValue,14),[LoPartialKey])) Then
                 Begin
                    If MsgDlg('Já existe esse item na requisição. Inserir outro ','Confimação',mtConfirmation,[mbOK,mbCancel],0) = mrCancel Then
                       Begin
                          FuncaoGeral.TiraIcone;
                          If bInsert Then
                             qryDet.Insert
                          Else
                             qryDet.Edit;
                          LimpaDet;
                          dblcItem.SetFocus;
                          Exit;
                       End;
                 End;
              If bInsert Then
                 qryDet.Insert
              Else
                 qryDet.Edit;
              qryDet.FieldByName('CODARTIGO').AsString := dblcItem.LookUpValue;
              qryDet.FieldByName('DESCRICAO').AsString := dblcDesc.Text;
              qryDet.FieldByName('QTDEMOV').AsFloat    := rQtde;
              qryDet.FieldByName('VALORMOV').AsFloat   := EdValb.Value;
              if RgDest.ItemIndex = 0 then
                 qryDet.FieldByName('FLGDEST').AsString := 'I'
              else
                 qryDet.FieldByName('FLGDEST').AsString := 'F';

              qryDetCalcFields( QryDet );
       End;
    If ExisteReq(edNumReq.Text,dblcItem.LookupValue) then
       Begin
          MsgDlg('Já existe o item '+dblcDesc.Text+ ' com Nº de requisição igual a '+edNumReq.Text,'Erro',mtError,[mbOk],0);
          dblcItem.SetFocus;
          Exit;
       End
    Else
    If edQtde.Value = 0  Then
       Begin
          MsgDlg('Proibido requisitar quantidade iqual a zero ','Erro',mtError,[mbOk],0);
          dblcItem.SetFocus;
          Exit;
       End;
    inherited;
    If qryDet.State = dsInsert Then
       Begin
          LimpaDet;
          dblcItem.SetFocus;
       End;
End;

Procedure TFrmRequisicao.SelTipoMov;
Begin
    Case rgTipMov.ItemIndex Of
       0 : Begin
              If qryAlmox.Locate('CodAlmoxarifado',dblcAlmox.LookUpValue,[LoPartialKey]) Then
                 Begin
                    sAlmoxDestino := qryAlmox.FieldbyName('PRINCIPSECUND').AsString;
                    sCCustoOrigem := qryAlmox.FieldbyName('CodCentroCusto').AsString;
                    iCodCusteio   := qryAlmox.FieldbyName('CodCusteio').AsInteger;
                 End;
              bTranf := True;
                IF (sAlmoxOrigem = 'P') And (sAlmoxDestino= 'S') Then
                   Begin
                      TipoMovSai := 'F';
                      TipoMovEnt := 'B';
                   End
                Else
                IF (sAlmoxOrigem = 'P') And (sAlmoxDestino= 'P') Then
                   Begin
                      TipoMovSai := 'F';
                      TipoMovEnt := 'B';
                   End
                Else
                IF (sAlmoxOrigem = 'S') And (sAlmoxDestino= 'P') Then
                   Begin
                      TipoMovSai := 'R';
                      TipoMovEnt := 'S';
                   End
                Else
                IF (sAlmoxOrigem = 'S') And (sAlmoxDestino= 'S') Then
                   Begin
                      TipoMovSai := 'G';
                      TipoMovEnt := 'B';
                   End;
           End;
       1 : Begin
              bTranf := False;
           End;
       2 : Begin
              bTranf := False;
           End;
   End;
End;
Procedure TFrmRequisicao.FazOPeracao( sCodArt,sUnid : String; rValor,rQtde : Double );
var iMov:LongInt;
Begin
    Case rgTipMov.ItemIndex Of
       0 : Begin
              iMov := MovNew.GeraMov('S',
                                     rValor,
                                     rQtde,
                                     Modulo.iCodCusteio,
                                     Modulo.iCodAlmoxa,
                                     sCodArt,
                                     '',
                                     TipoMovSai,
                                     sUnid,
                                     '',
                                     edDataReq.Text,
                                     FloatToStr(EdNumReq.Value),
                                     sCCustoOrigem,
                                     Sistema.IdEmpresa,
                                     strToInt(dblcAlmox.LookUpValue),
                                     strToInt(dblcAtiv.LookUpValue) );
                     if iMov = -1 then
                        Abort;
              rValor := 0;
              If FazQuery(dtmBaseDados.qry,'SELECT VALORMOV*(-1) AS VALOR FROM MOVIMENT WHERE (IDMOV = '+IntToStr(iMov)+')') Then
                 rValor := dtmBaseDados.qry.FieldByName('VALOR').AsFloat;
              iMov := MovNew.GeraMov('E',
                                      rValor,
                                      rQtde,
                                      iCodCusteio,
                                      strToInt(dblcAlmox.LookUpValue),
                                      sCodArt,
                                      '',
                                      TipoMovEnt,
                                      sUnid,
                                      '',
                                      edDataReq.Text,
                                      FloatToStr(EdNumReq.Value),
                                      sCCustoDestino,
                                      Sistema.IdEmpresa,
                                      Modulo.iCodAlmoxa,
                                      strToInt(dblcAtiv.LookUpValue) );
                     if iMov = -1 then
                          Abort;
           End;
       1 : Begin
                iMov := MovNew.GeraMov('S',
                                       rValor,
                                       rQtde,
                                       Modulo.iCodCusteio,
                                       Modulo.iCodAlmoxa,
                                       sCodArt,
                                       '',
                                       'E',
                                       sUnid,
                                       '',
                                       edDataReq.Text,
                                       FloatToStr(EdNumReq.Value),
                                       dblcCCust.LookUpValue,
                                       Sistema.IdEmpresa,
                                       0,
                                       strToInt(dblcAtiv.LookUpValue) );
                      if iMov = -1 then
                           Abort;
                    End;
       2 : Begin
             iMov := MovNew.GeraMov('S',
                                    rValor *(-1),
                                    rQtde *(-1),
                                    Modulo.iCodCusteio,
                                    Modulo.iCodAlmoxa,
                                    sCodArt,
                                    '',
                                    'P',
                                    sUnid,
                                    '',
                                    edDataReq.Text,
                                    FloatToStr(EdNumReq.Value),
                                    dblcCCust.LookUpValue,
                                    Sistema.IdEmpresa,
                                    0,
                                    strToInt(dblcAtiv.LookUpValue) );
               if iMov = -1 then
                    Abort;
             End;
   End;
End;

Function TFrmRequisicao.VerifDados( d : TDateTime ) : Boolean;
Begin
    Result := True;
    qryDet.First;
    While Not QryDet.EOF Do
      Begin
         If(Format('%17.5f',[qryDet.FieldByName('QTDEMOV').asFloat]) > Format('%17.5f',[MovNew.InfoSaldo(qryDet.FieldByName('CODARTIGO').asString,Modulo.iCodAlmoxa,edDataReq.Date)]) )
            And(qryDet.FieldByName('FLGDEST').asString = 'I' )
         Then
           Result := False;
         qryDet.Next;
      End;
End;

Procedure TFrmRequisicao.CmeCadastroConfirma(Sender: TObject);
Begin
   If qryDet.IsEmpty then
      Begin
         MsgDlg('Não há itens lançados nesta requisição','Erro',mtError,[mbOk],0);
         edNumReq.SetFocus;
      end
   Else
   If (trim(dblcAtiv.Text) = '') Then
      Begin
         MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
         dblcAtiv.SetFocus;
      End
   Else
   If (trim(dblcAlmox.Text) = '') and (rgTipMov.ItemIndex = 0) Then
      Begin
         MsgDlg('Almoxarifado Destino não foi preenchido','Erro',mtError,[mbOk],0);
         dblcAlmox.SetFocus;
      End
   Else
   If (trim(dblcCCust.Text) = '') and (rgTipMov.ItemIndex <> 0) Then
      Begin
         MsgDlg('Centro de Custo Destino não foi preenchido','Erro',mtError,[mbOk],0);
         dblcCCust.SetFocus;
      End
   Else
   If EdNumReq.Value = 0 Then
      Begin
         MsgDlg('Número da requisição não foi preenchido','Erro',mtError,[mbOk],0);
         EdNumReq.SetFocus;
      End
   Else
   If Trim(EdDataReq.Text) = '' Then
      Begin
         MsgDlg('Data de requisição não foi preenchida','Erro',mtError,[mbOk],0);
         EdDataReq.SetFocus;
      End
   Else
   If Not VerifDados(EdDataReq.Date) And (rgTipMov.ItemIndex <> 2 ) Then
      Begin
         MsgDlg('Você, provavelmente, alterou a data depois de inserir itens na requisição. Ocasionando mudança no saldo disponível.','Erro',mtError,[mbOk],0);
         EdDataReq.SetFocus;
      End
   Else
      Begin
          SelTipoMov;
          qryDet.First;
           Try
               StartTransacao;
                While Not QryDet.EOF Do
                 Begin
                     IF QryDet.FieldByName('FLGDEST').asString = 'I' Then
                        FazOperacao(qryDet.FieldByName('CodArtigo').AsString,
                                    qryDet.FieldByName('UN').AsString,
                                    qryDet.FieldByName('ValorMov').AsFloat,
                                    qryDet.FieldByName('QtdeMov').AsFloat)
                      Else
                         Begin
                             qryFichaTec.Close;
                             qryFichaTec.Params[0].asString := Trim(qryDet.FieldByName('CodArtigo').AsString);
                             qryFichaTec.Open;
                             qryFichaTec.First;
                             While Not qryFichaTec.EOF Do
                                Begin
                                   rQtde := ConversaoMed.ConverteQtdeUnCM(qryFichaTec.FieldByName('CodArtigoSec').AsString,
                                                                          qryFichaTec.FieldByName('CODMEDIDA').AsString,
                                                                          qryFichaTec.FieldByName('Qtde').AsFloat * qryDet.FieldByName('QtdeMov').AsFloat);
                                   rValor := SelCusto(qryFichaTec.FieldByName('CodArtigoSec').AsString);
                                   FazOperacao(qryFichaTec.FieldByName('CodArtigoSec').AsString,
                                               qryFichaTec.FieldByName('CODMEDIDA').AsString,
                                               rValor,
                                               qryFichaTec.FieldByName('Qtde').AsFloat * qryDet.FieldByName('QtdeMov').AsFloat);
                                   qryFichaTec.Next;
                                End;
                         End;
                      qryDet.Next;
                  End;
               CommitTransacao;
           Except
               RollBackTransacao;
               MsgDlg('Não foi possível executar a gravação. Verifique','Erro',mtError,[mbOk],0);
               Exit;
               Raise;
           End;
         qry.CancelUpdates;
         qrydet.CancelUpdates;
         Limpar;
      End;
End;
Procedure TFrmRequisicao.CmeCadastroCancel(Sender: TObject);
Begin
//   inherited;
   pnlMestre.Enabled := True;
   qry.CancelUpdates;
   qrydet.CancelUpdates;
   Limpar;
End;

procedure TFrmRequisicao.rgTipMovClick(Sender: TObject);
begin
  inherited;
    Case rgTipMov.ItemIndex Of
       1 : Begin
              dblcAlmox.Text := '';
              dblcAlmox.Enabled := False;
              dblcCCust.Enabled := True;
           End;
       0 : Begin
              dblcAlmox.Enabled := True;
              dblcCCust.Text := '';
              dblcCCust.Enabled := False;
           End;
    Else
        Begin
            dblcAlmox.Text := '';
            dblcAlmox.Enabled := False;
            dblcCCust.Enabled := True;
        End;
    End;
end;

procedure TFrmRequisicao.dblcAlmoxExit(Sender: TObject);
begin
  inherited;
   If Trim(dblcAlmox.Text) <> '' Then
     If Not SelTransf(dblcAlmox.LookUpValue) Then
        Begin
            MsgDlg('Esse almoxarifado não está disponível para tranferência','Error',MtError,[mbOk],0);
            dblcAlmox.Text := '';
            dblcAlmox.SetFocus;
         End;
end;
procedure TFrmRequisicao.LimpaDet;
Begin
   dblcItem.Text     := '';
   dblcDesc.Text     := '';
   dblcUN.Text       := '';
   edQtde.Value      := 0;
   dbSaldoQtde.Value := 0;
   dbUn.Text         := '';
   edValB.Value      := 0;
End;

procedure TFrmRequisicao.Limpar;
Begin
   dblcAlmox.Text := '';
   dblcCCust.Text := '';
   edDataReq.Text := '';
   edNumReq.Value := 0;
   dblcAtiv.Clear;
End;

procedure TFrmRequisicao.qryDetCalcFields(DataSet: TDataSet);
Var sPos:String;
begin
  inherited;
   If qryDet.State In [DsEdit,DsInsert] Then
      Exit;
   sPos := trim(qryDetCodArtigo.AsString)+' ';
   If qrySaldo.Locate('CodArtigo',sPos,[LoPartialKey]) Then
      qryDetUn.AsString := qrysaldo.FieldByname('CodMedCusto').AsString;
end;

procedure TFrmRequisicao.edDataReqExit(Sender: TObject);
begin
  inherited;
  If edDataReq.Date > Date Then
    Begin
        MsgDlg('Data da requisição não pode ser maior que a data de hoje','Erro',mtError,[mbOk],0);
        EdDataReq.SetFocus;
    End;
end;

procedure TFrmRequisicao.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  inherited;
       sbtnInserir.Enabled  := True;
       sbtnAlterar.Enabled  := False;
       sbtnApagar.Enabled   := False;
       sbtnProcurar.Enabled := False;
end;

procedure TFrmRequisicao.dblcAlmoxCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  SelTipoMov;
end;

function TFrmRequisicao.ExisteReq(sNumDoc, sCodArt: String): Boolean;
Var
   SQL : String;
begin
   SQL := ' SELECT COUNT(IDMOV) AS NUMREQ '+
          ' FROM MOVIMENT       '+
          ' WHERE (CODARTIGO = '+QuotedStr(Espaco(Trim(sCodArt),14))+') '+
          '   AND (NUMDOCUMENTO = '+QuotedStr(Trim(sNumDoc))+') '+
          '   AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ';
   FazQuery(DtmBaseDados.qry,SQL);
   Result := DtmBaseDados.qry.FieldByName('NUMREQ').AsInteger > 0 ;
end;

end.


