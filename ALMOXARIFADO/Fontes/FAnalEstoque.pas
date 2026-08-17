unit FAnalEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DBCtrls, ComCtrls,
  CMTree,  TREdit, Grids, Wwdbigrd, Wwdbgrid, IvDictio,
  IvMulti, IvEMulti, Mask, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TFrmAnalEstoque = class(TfrmCadastroCS)
    grpTempo   : TGroupBox;
    grpConsumo : TGroupBox;
    Label1     : TLabel;
    qryGrupoProd: TwwQuery;
    qryGrupoProdCODGRUPOPROD: TStringField;
    qryGrupoProdDESCGRUPOPROD: TStringField;
    qryGrupoProdSTATUSGRUPO: TStringField;
    dsGrupoProd: TwwDataSource;
    edGrupoProd: TMaskEdit;
    spdGrupoProd: TSpeedButton;
    treeGrupoProd: TCMTreeView;
    dbedtempMedDF: TCMDateTimePicker;
    Label4: TLabel;
    qryIDANALISEESTOQUE: TFloatField;
    qryIDPESSOA: TFloatField;
    qryNUMSOLCOMPRA: TFloatField;
    qryCODGRUPOPROD: TStringField;
    qryCODALMOXARIFADO: TFloatField;
    qryDATAINICONSMED: TDateTimeField;
    qryDATAFIMCONSMED: TDateTimeField;
    qryFLGACEITA: TStringField;
    qryPERCMINIMO: TFloatField;
    qryDATAINITRMED: TDateTimeField;
    qryDATAFIMTRMED: TDateTimeField;
    qryDATAANALISE: TDateTimeField;
    dbedConsMedDi: TCMDateTimePicker;
    dbedConsMedDF: TCMDateTimePicker;
    Label2: TLabel;
    Label5: TLabel;
    RgPonto: TRadioGroup;
    qryAux: TwwQuery;
    dbedDataAnal: TCMDateTimePicker;
    dbedtempMedDI: TCMDateTimePicker;
    rgTRM: TRadioGroup;
    rgConsMed: TRadioGroup;
    updItem: TUpdateSQL;
    qryItem: TwwQuery;
    qryItemCODARTIGO: TStringField;
    qryItemTRMEDCALCULADO: TFloatField;
    qryItemFLGTEMPMEDCALC: TStringField;
    qryItemTRMEDINFORMADO: TFloatField;
    qryItemCONSMEDCALCULADO: TFloatField;
    qryItemFLGCONSMEDCALC: TStringField;
    qryItemCONSMEDINFORMADO: TFloatField;
    qryItemPONTOREPCALCULADO: TFloatField;
    qryItemFLGPONTOREPCALC: TStringField;
    qryItemPONTOREPINFORMADO: TFloatField;
    qryItemQTDEMINCALCULADA: TFloatField;
    qryItemFLGQTDEMINCALC: TStringField;
    qryItemQTDEMININFORMADA: TFloatField;
    qryItemQTDESUGAUTO: TFloatField;
    qryItemQTDESUGCALCULADA: TFloatField;
    qryItemIDANALISEESTOQUE: TFloatField;
    qryItemQTDECOMPRAR: TFloatField;
    qryItemSALDOESTOQUE: TFloatField;
    qryItemPERIDOCOMPRA: TFloatField;
    dsItem: TwwDataSource;
    qrySaldo: TwwQuery;
    qrySaldoCODARTIGO: TStringField;
    qrySaldoESTMINUSADO: TFloatField;
    qrySaldoPTORESUSADO: TFloatField;
    qrySaldoTEMRESUSADO: TFloatField;
    qrySaldoCONMEDUSADO: TFloatField;
    qrySaldoPERIODOCOMPRA: TFloatField;
    GroupBox1: TGroupBox;
    dbedPercMin: TDBRealEdit;
    lblPerc: TLabel;
    rgPercMin: TRadioGroup;
    qrySaldoSALDOQTDE: TFloatField;
    btGeraAnal: TBitBtn;
    qryItemDESCRICAO: TStringField;
    qrySaldoDESCRICAO: TStringField;
    procedure spdGrupoProdClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure treeGrupoProdExit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    procedure btGeraAnalClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure GerarAnalise;
  public
    Function CalcConsMed( pCodArt  : String; DI,DF : TDateTime  ) : Double ;
    Function CalcTRM( pCodArt  : String; DI,DF : TDateTime  ) : Integer ;
    Function CalcQtdeSug(rCM,rPR,rPeriodoCompra,rSaldo:Double) :Double;
    Function CalcPontoRep(rCM,rPerMin,rQtdeMin,rTRM:Double;bPerc:Boolean) :Double;
    Function CalcQtdeMin(rPerMin,rPtoRep:Double) :Double;
    { Public declarations }
  end;

var
  FrmAnalEstoque : TFrmAnalEstoque;
  iDias          : Double;
  bAnalise       : Boolean;
implementation

{$R *.DFM}
Uses uModulo, uMensErro, uSistema, uDataBase, FAnalSug, FTelaAut, uFuncaoGeral;

procedure TFrmAnalEstoque.spdGrupoProdClick(Sender: TObject);
begin
  inherited;
  treeGrupoProd.Top  := edGrupoProd.Top + 25;
  treeGrupoProd.Left := edGrupoProd.Left;
  treeGrupoProd.Visible := not treeGrupoProd.Visible;
  if treeGrupoProd.Visible
  then treeGrupoProd.SetFocus;
end;

procedure TFrmAnalEstoque.FormCreate(Sender: TObject);
begin
  inherited;
  treeGrupoProd.Mascara:=trim(Modulo.sMascaraGrupoProd);
  edGrupoProd.editmask :=trim(Modulo.sMascaraGrupoProd)+ ';0;_';
  edGrupoProd.Text:='';
  //
  qryGrupoProd.Open;
  //
  treeGrupoProd.montaarvore;
  MontaSelect.Filtro.Add(' ANALISEESTOQUE.IDPESSOA = '+ IntToStr(Sistema.idEmpresa) );
  MontaSelect.Filtro.Add(' ANALISEESTOQUE.CODALMOXARIFADO = '+ IntToStr(Modulo.icodAlmoxa) );
  MontaSelect.Filtro.Add(' ANALISEESTOQUE.FLGACEITA = ''N'' ');
  With qry Do
    Begin
       Close;
       Params[0].asInteger := -1;
       Open;
   End;
   bAnalise := False;
   btGeraAnal.Enabled := False;
   btGeraAnal.Caption := '&Gerar Análise';
 //
end;

procedure TFrmAnalEstoque.treeGrupoProdExit(Sender: TObject);
begin
  inherited;
  treeGrupoProd.Visible := false;
  edGrupoProd.Text := '';
  edGrupoProd.Text := treeGrupoProd.ValorChave;
  edGrupoProd.SetFocus;
end;
procedure TFrmAnalEstoque.CmeCadastroConfirma(Sender: TObject);
Begin
    Modulo.idAnalise:=qry.FieldByName('IDANALISEESTOQUE').AsInteger;
    qry.FieldByName('FLGACEITA').asString := 'N';
    bAnalise := True;
    btGeraAnal.Enabled := False;
    btGeraAnal.Caption := '&Gerar Análise';
    inherited;
    If qry.State in [dsInsert] Then
    else
    Begin
       qry.Close;
       qry.Params[0].asInteger := 0;
       qry.Open;
       btGeraAnal.Enabled := False;
       btGeraAnal.Caption := '&Gerar Análise';
    end;
End;

procedure TFrmAnalEstoque.CmeCadastroCancel(Sender: TObject);
Begin
    bAnalise := True;
    btGeraAnal.Enabled := False;
    btGeraAnal.Caption := '&Gerar Análise';
    inherited;
End;

procedure TFrmAnalEstoque.CmeCadastroEdit(Sender: TObject);
Begin
   inherited;
   pnlFundo.Enabled   := True;
   bAnalise           := False;
   btGeraAnal.Enabled := True;
   btGeraAnal.Caption := '&Alterar Análise';
   btGeraAnal.SetFocus;
End;

procedure TFrmAnalEstoque.CmeCadastroInsert(Sender: TObject);
Begin
   inherited;
   pnlFundo.Enabled:=True;
   bAnalise := False;
   btGeraAnal.Enabled := True;
   btGeraAnal.Caption := '&Gerar Análise';
   With qry Do
     Begin
        FieldByName('DATAINICONSMED').AsDateTime :=  Date;
        FieldByName('DATAFIMCONSMED').AsDateTime :=  Date;
        FieldByName('DATAINITRMED').AsDateTime   :=  Date;
        FieldByName('DATAFIMTRMED').AsDateTime   :=  Date;
        FieldByName('DATAANALISE').AsDateTime    :=  Date;
        dbedtempMedDI.Date := Date;
        dbedtempMedDF.Date := Date;
        dbedConsMedDi.Date := Date;
        dbedConsMedDF.Date := Date;
        dbedDataAnal.Date  := Date;
     End;
   dbedDataAnal.SetFocus;
End;

procedure TFrmAnalEstoque.CmeCadastroFind(Sender: TObject);
Begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
     Begin
          With qry Do
             Begin
                 Close;
                 Params[0].asInteger :=  StrToInt(MontaSelect.ValoresChave[0]);
                 Open;
                 btGeraAnal.Enabled := False;
                 btGeraAnal.Caption := '&Gerar Análise';
             End;
     End;
End;

Function TFrmAnalEstoque.CalcConsMed( pCodArt  : String; DI,DF  : TDateTime  ) : Double ;
Begin
   with qryAux Do
     Begin
         Close;
         Sql.Text := ' SELECT '+
                     '      (SUM(QTDEMOV)* -1) AS CM '+
                     ' FROM '+
                     '      MOVIMENT  '+
                     ' WHERE '+
                     '      (RTRIM(CODARTIGO) = '''+Trim(pCodArt)+''')'+
                     '  AND (DATAMOV >= TO_DATE('''+DateToStr(DI)+''',''dd/mm/yyyy'')) '+
                     '  AND (DATAMOV <= TO_DATE('''+DateToStr(DF)+''',''dd/mm/yyyy'')) '+
                     '  AND (CODALMOXARIFADO ='+ IntToStr(Modulo.icodAlmoxa)+')'+
                     '  AND (CODTIPOMOV <> ''A'') '+
                     '  AND (CODTIPOMOV <> ''K'') '+
                     '  AND (CODTIPOMOV <> ''Z'') ';
         Open;
      If IsEmpty Then
         CalcConsMed := 0
      Else
         CalcConsMed := (FieldByName('CM').AsFloat/iDias);
     End;
End;


Function TFrmAnalEstoque.CalcTRM( pCodArt  : String; DI,DF  : TDateTime ) : Integer ;
Begin
   with qryAux Do
     Begin
         Close;
         Sql.Text := ' Select ((Sum(Numdias)/Count(*)) ) as TRM '+
                     ' From SoliBaixadas '+
                     ' Where '+
                     '      (DataEmisSoli >= To_Date('''+DateToStr(DI)+''',''dd/mm/yyyy'') )'+
                     '  And (DataReceb <= To_Date('''+DateToStr(DF)+''',''dd/mm/yyyy'') )'+
                     '  And (idPessoa = '+ IntToStr(Sistema.idempresa)+')'+
                     '  And (IDITEMSOLI IN (SELECT IDITEMSOLI FROM ITEMSOLI WHERE (RTRIM(CodArtigo) = '''+Trim(pCodArt)+''')) ) ';
         Open;
      If IsEmpty Then
         CalcTRM := 0
      Else
         CalcTRM := FieldByName('TRM').asInteger;
     End;
End;

Procedure TFrmAnalEstoque.GerarAnalise;
var
   sCodArtigo   : String;
   //
   iTempRessup  : Integer;
   rConsMed     : Double;
   rPtoRep      : Double;
   rQtdeMin     : Double;
   rQtdeSug     : Double;
   //
   iTempRessup2 : Integer;
   rConsMed2    : Double;
   rPtoRep2     : Double;
   rQtdeMin2    : Double;
   rQtdeSug2    : Double;
   //
   iTempRessupV : Integer;
   rConsMedV    : Double;
   rPtoRepV     : Double;
   //
   bPerc        : Boolean;
Begin
   iDias:=(dbedConsMedDF.Date - dbedConsMedDi.Date)+1;
   With qrySaldo Do
      Begin
          Close;
          Sql.Text := ' Select   '+
                      '     S.CODARTIGO,    '+
                      '     S.ESTMINUSADO,  '+
                      '     S.PTORESUSADO,  '+
                      '     S.TEMRESUSADO,  '+
                      '     S.CONMEDUSADO,  '+
                      '     S.PERIODOCOMPRA,'+
                      '     S.SALDOQTDE,    '+
                      '    ( P.DescProd || '' '' || A.CodTamanho || '' '' || A.CodCor ) as Descricao '+
                      ' From                '+
                      '     Saldo S,        '+
                      '     Produto P,      '+
                      '     Artigo A        '+
                      ' Where               '+
                      '       (S.CodAlmoxarifado = '+IntToStr(Modulo.iCodAlmoxa)+')  '+
                      '   And (S.idPessoa = '+IntToStr(Sistema.IdEmpresa)+')         ';
                      If Trim(edGrupoProd.Text) <> '' Then
                          Sql.Add(' And (RTRIM(P.CodGrupoProd) = '''+Trim(qryGrupoProd.FieldByName('CodGrupoProd').AsString)+''')');

           Sql.add('   And ( P.ITEMESTOCAVEL = ''S'')      '+
                   '   AND (A.FLGATIVO = ''S'')            '+
                   '   And ( A.CodProduto = P.CodProduto)  '+
                   '   And ( A.CodArtigo = S.CodArtigo )   ');
          Open;
          //
          If IsEmpty Then
            Begin
               MsgDlg('Não foi encontrado nenhum artigo para Análise ','Informação',mtInformation,[mbOK],0);
               Exit;
               FuncaoGeral.TiraIcone;
            End;
          First;
          While Not EOF Do
             Begin
                sCodArtigo  := FieldByName('CODARTIGO').asString;
                iTempRessup := CalcTRM(sCodArtigo,dbedtempMedDI.Date,dbedtempMedDF.Date);
                rConsMed    := CalcConsMed(sCodArtigo,dbedConsMedDi.Date,dbedConsMedDF.Date);
                //
                rQtdeMin2    := FieldByName('ESTMINUSADO').asFloat;
                rPtoRep2     := FieldByName('PTORESUSADO').asFloat;
                iTempRessup2 := FieldByName('TEMRESUSADO').asInteger;
                rConsMed2    := FieldByName('CONMEDUSADO').asFloat;
                //
                If RgTRM.ItemIndex = 0 Then
                   iTempRessupV := iTempRessup
                Else
                   iTempRessupV := iTempRessup2;
                //
                If RgConsMed.ItemIndex = 0 Then
                   rConsMedV := rConsMed
                Else
                   rConsMedV := rConsMed2;
                //
                if rgPercMin.ItemIndex = 1 then
                   bPerc:=True
                else
                   bPerc:=False;
                rPtoRep   := CalcPontoRep(rConsMedV,dbedPercMin.Value,rQtdeMin2,iTempRessupV,bPerc);
                //
                If RgPonto.ItemIndex = 1 Then
                   rPtoRepV := rPtoRep
                Else
                   rPtoRepV := rPtoRep2;
                //
                rQtdeMin    := CalcQtdeMin(dbedPercMin.Value,rPtoRepV);
               //
               // Calculo da Quantidade Sugerida
               //
               rQtdeSug2:=CalcQtdeSug(rConsMedV,rPtoRepV,FieldByName('PERIODOCOMPRA').asFloat,FieldByName('SALDOQTDE').asFloat);
               rQtdeSug :=CalcQtdeSug(rConsMed,rPtoRep,FieldByName('PERIODOCOMPRA').asFloat,FieldByName('SALDOQTDE').asFloat);
               //
               qryItem.Append;
               qryItem.FieldByName('IDANALISEESTOQUE').asInteger := qry.FieldByName('IDANALISEESTOQUE').AsInteger;
               qryItem.FieldByName('CodArtigo').asString         := sCodArtigo;
               qryItem.FieldByName('Descricao').asString         := FieldByName('Descricao').asString;
               //
               qryItem.FieldByName('CONSMEDCALCULADO').asFloat   := rConsMed;
               qryItem.FieldByName('TRMEDCALCULADO').asInteger   := iTempRessup;
               qryItem.FieldByName('PONTOREPCALCULADO').asFloat  := rPtoRep;
               qryItem.FieldByName('QTDEMINCALCULADA').asFloat   := rQtdeMin;
               qryItem.FieldByName('QTDESUGAUTO').asFloat        := rQtdeSug;
               //
               qryItem.FieldByName('CONSMEDINFORMADO').asFloat   := rConsMed2;
               qryItem.FieldByName('TRMEDINFORMADO').asInteger   := iTempRessup2;
               qryItem.FieldByName('PONTOREPINFORMADO').asFloat  := rPtoRep2;
               qryItem.FieldByName('QTDEMININFORMADA').asFloat   := rQtdeMin2;
               qryItem.FieldByName('QTDESUGCALCULADA').asFloat   := rQtdeSug2;
               qryItem.FieldByName('QTDECOMPRAR').asFloat        := rQtdeSug2;
               //
               If rgConsMed.ItemIndex = 0 Then
                  qryItem.FieldByName('FLGCONSMEDCALC').asString := 'S'
               Else
                  qryItem.FieldByName('FLGCONSMEDCALC').asString := 'N';

               If rgTRM.ItemIndex = 0 Then
                  qryItem.FieldByName('FLGTEMPMEDCALC').asString := 'S'
               Else
                  qryItem.FieldByName('FLGTEMPMEDCALC').asString := 'N';

               If RgPonto.ItemIndex = 0 Then
                  qryItem.FieldByName('FLGPONTOREPCALC').asString := 'N'
               Else
                  qryItem.FieldByName('FLGPONTOREPCALC').asString := 'S';

               If rgPercMin.ItemIndex = 1 Then
                  qryItem.FieldByName('FLGQTDEMINCALC').asString  := 'S'
               Else
                  qryItem.FieldByName('FLGQTDEMINCALC').asString  := 'N';

               qryItem.FieldByName('SALDOESTOQUE').asFloat  := FieldByName('SALDOQTDE').asFloat;
               qryItem.FieldByName('PERIDOCOMPRA').asFloat  := FieldByName('PERIODOCOMPRA').asFloat;
               qryItem.Post;
               Next;
             End;
     End;
     AbrirForm(FrmAnalSug,TFrmAnalSug,False);
End;

Function TFrmAnalEstoque.CalcQtdeSug(rCM,rPR,rPeriodoCompra,rSaldo:Double):Double;
Begin
   Result := (rCM * rPeriodoCompra)+ rPR - rSaldo;
   If Result < 0 Then
      Result := 0;
end;

Function TFrmAnalEstoque.CalcPontoRep(rCM,rPerMin,rQtdeMin,rTRM:Double;bPerc:Boolean) :Double;
Begin
    if bPerc then
       result := (rCM*rTRM)/(1 - (rPerMin/100))
    else
       result := (rCM*rTRM)+rQtdeMin;
end;

Function TFrmAnalEstoque.CalcQtdeMin(rPerMin,rPtoRep:Double) :Double;
Begin
    result :=(rPtoRep*(rPerMin/100));
end;

procedure TFrmAnalEstoque.btGeraAnalClick(Sender: TObject);
begin
   inherited;
  If rgPercMin.ItemIndex = 1 Then
     Begin
         If dbedPercMin.Value = 0 Then
            Begin
               MsgDlg('Percentual não foi digitado','Erro',mtError,[mbOk],0);
               dbedPercMin.SetFocus;
               Exit;
            End;
     End;
  If Not bAnalise Then
     Begin
        If qry.State in [dsInsert] Then
           Begin
              With qry do
                 Begin
                    FieldByName('IDANALISEESTOQUE').asInteger := LeUltRegistro(nil,'ANALISEESTOQUE');
                    FieldByName('IDPESSOA').asInteger         := Sistema.IdEmpresa;
                    FieldByName('CODALMOXARIFADO').asInteger  := Modulo.iCodAlmoxa;
                 End;
           End;
           With qryItem Do
             Begin
                 Close;
                 ParamByName('pIDANAL').Value := qry.FieldByName('IDANALISEESTOQUE').asInteger;
                 Open;
             End;
           If qry.State in [dsInsert] Then
               GerarAnalise
           Else
               AbrirForm(FrmAnalSug,TFrmAnalSug,False);
         bAnalise := True;
    End;
end;

procedure TFrmAnalEstoque.bbtnConfirmarClick(Sender: TObject);
begin
  If Not bAnalise Then
    Begin
        MsgDlg('Análise ainda não foi gerada','Erro',mtError,[mbOk],0);
        BtGeraAnal.SetFocus;
        Exit;
    End;
   inherited;
   bbtnCancelar.Click;
end;

procedure TFrmAnalEstoque.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Para podermos fazer o cancel da outra tela;
end;

procedure TFrmAnalEstoque.CmeCadastroDelete(Sender: TObject);
begin
   try
      StartTransacao;
      qryAux.Close;
      qryAux.SQL.Text := ' DELETE FROM ITEMANALISEESTOQ WHERE (IDANALISEESTOQUE =' + qry.FieldByName('IDANALISEESTOQUE').asString +')';
      qryAux.ExecSql;
      qry.Delete;
      qry.ApplyUpdates;
      CommitTransacao;
      qry.Close;
      qry.Params[0].asInteger := 0;
      qry.Open;
      btGeraAnal.Enabled := False;
      btGeraAnal.Caption := '&Gerar Análise';
   except
      RollBacktransacao;
      MsgDlg('Exclusão não foi efetuada','Erro',mtError,[mbOK],0);
      Raise;
   end;
end;
end.
