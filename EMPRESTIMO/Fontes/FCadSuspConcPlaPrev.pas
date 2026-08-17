{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 164198 KINTANA 1409417
Data        : 07/02/2012
Autor       : Vinicius Ferreira
Descrição   : Criação de Funcionalidade para bloqueio de concessões por plano previdenciário.
--------------------------------------------------------------------------------}

unit FCadSuspConcPlaPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, DBTables, Wwquery,
  CmEventosCadastro, ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  CheckLst, wwdblook, wwdbdatetimepicker, DBCtrls;

type
  TfrmCadSuspConcPlaPrev = class(TfrmCadastroCS)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    qryHistAlt: TwwQuery;
    dsHistAlt: TwwDataSource;
    wwDBGrid2: TwwDBGrid;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    edtDataInicio: TwwDBDateTimePicker;
    Label3: TLabel;
    edtDataFim: TwwDBDateTimePicker;
    dblkpcmbBenef: TwwDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    lstPlaContabil: TCheckListBox;
    qryExcPlanContabil: TwwQuery;
    dsExcPlanContabil: TwwDataSource;
    dbckbPeriodoIndeterminado: TDBCheckBox;
    dsLookPlanPrev: TwwDataSource;
    qryLookPlanPrev: TwwQuery;
    qryItens: TwwQuery;
    lstPlaContabilMostra: TCheckListBox;
    qryHistSusp: TwwQuery;
    dsHistSusp: TwwDataSource;
    updHistSusp: TUpdateSQL;
    qryHistSuspIDSUSPXPLANOPREVEMPTMO: TFloatField;
    qryHistSuspIDPLANOPREV: TFloatField;
    qryHistSuspIDPLANOPREVCONTABIL: TMemoField;
    qryHistSuspDTINICIO: TDateTimeField;
    qryHistSuspDTFIM: TDateTimeField;
    qryHistSuspFLGPRAZOINDETERMINADO: TFloatField;
    qryHistSuspTRGDTINCLUSAO: TDateTimeField;
    qryHistSuspTRGUSERINCLUSAO: TStringField;
    qryHistSuspNOME: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure PreencheMod;
    procedure PreencheModEdt;
    procedure AtualizaLogExPlaContabil;
    procedure LancaMod;
    procedure LancaModEdt;
    procedure AtualizaLog;
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure wwDBGrid2CellChanged(Sender: TObject);
    procedure dblkpcmbBenefNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dblkpcmbBenefChange(Sender: TObject);

  private
    { Private declarations }
    dOldDataInicial, dOldDataFinal: TDateTime;
    sOldStatus, sOldPrazoInd, sOldExPlaContabil: String;
  public
    { Public declarations }
    vIDMod : array of Int64;
    idsucemptmo : Integer;
    strModold : String;
    strModnew : String;
    FlgEditar,FlgIncluir,FlgExcluir,modadd,moddel,FlgGravou : Boolean;
    function  PegaMod: String;
    function PegaDescExPlaContabil(StrExPlaContabil : string): String;
  end;

var
  frmCadSuspConcPlaPrev: TfrmCadSuspConcPlaPrev;

implementation
{$R *.DFM}
uses
  dBaseDados, uSistema, uMensErro, UDatabase;
  //, UModulo, uFuncoesEmptmo, dLookEmptmo, dMS;

procedure TfrmCadSuspConcPlaPrev.FormCreate(Sender: TObject);
begin
  inherited;
  //if not dtmBaseDados.dbBaseDados.InTransaction then
  //dtmBaseDados.dbBaseDados.StartTransaction;
  //qryHistSusp.Close;
  //qryHistSusp.Open;
end;

procedure TfrmCadSuspConcPlaPrev.FormShow(Sender: TObject);
begin
  inherited;
  Panel1.SendToBack;

  qryHistSusp.Close;
  qryHistSusp.Open;

  qryLookPlanPrev.Close;
  qryLookPlanPrev.Open;

  If not (qryHistSusp.IsEmpty) Then
  Begin

    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := True;
    sbtnApagar.Enabled := True;
    pnlFundo.Enabled := True;

    qryHistAlt.Close;
    qryHistAlt.ParamByName('IDPLANOPREVCONTABIL').AsInteger := qryHistSusp.FieldByName('IDPLANOPREV').AsInteger;
    qryHistAlt.ParamByName('IDSUSPXPLANOPREVEMPTMO').AsInteger := qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsInteger;
    qryHistAlt.Open;

    qryLookPlanPrev.Close;
    qryLookPlanPrev.Open;
    qryLookPlanPrev.Locate('IDPLANOPREV',qryHistSusp.FieldByName('IDPLANOPREV').AsInteger,[]);

    if not(qryLookPlanPrev.EOF) then
    begin
       dblkpcmbBenef.LookupValue := qryHistSusp.FieldByName('IDPLANOPREV').AsString;
    end;
  End Else Begin
    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := False;
    sbtnApagar.Enabled := False;
  End;
end;

procedure TfrmCadSuspConcPlaPrev.bbtnConfirmarClick(Sender: TObject);
Var
iLogTotalPrev :Integer;
sDescricao :String;
xQrySuspPlanPrevExistente :TwwQuery;
begin

  dblkpcmbBenef.Enabled := True;

  If (FlgIncluir) or (FlgEditar) then begin
     If (qryHistSuspDTFIM.AsDatetime <> 0) and (dbckbPeriodoIndeterminado.Checked) then begin
      MsgDlg('Data final e Prazo indeterminado não podem ser utilizados no mesmo bloqueio.', 'Informação', mtInformation, [mbOk], 0);
      edtDataFim.SetFocus;
      Exit;
     end;
     if (dblkpcmbBenef.text = '') then begin
      MsgDlg('É obrigatório selecionar o plano previdenciário.', 'Informação', mtInformation, [mbOk], 0);
      dblkpcmbBenef.SetFocus;
      Exit;
     end;
     if (qryHistSuspDTINICIO.AsDatetime > qryHistSuspDTFIM.AsDatetime) and ( not(dbckbPeriodoIndeterminado.Checked)) and (qryHistSuspDTFIM.AsDatetime <> 0) then begin
      MsgDlg('A data início tem que ser menor que a data fim!', 'Informação', mtInformation, [mbOk], 0);
      edtDataFim.SetFocus;
      Exit;
     end;
     if qryHistSuspDTINICIO.AsString = '' then begin
      MsgDlg('É obrigatório informar a data de início.', 'Informação', mtInformation, [mbOk], 0);
      edtDataInicio.SetFocus;
      Exit;
     end;
     if (qryHistSuspDTFIM.AsDatetime = 0) and not(dbckbPeriodoIndeterminado.Checked) then begin
      MsgDlg('É necessário informar a data fim ou selecionar a opção "Período Indeterminado".', 'Informação', mtInformation, [mbOk], 0);
      edtDataFim.SetFocus;
      Exit;
     end;

     If qryHistSusp.State = dsinsert then
     qryHistSusp.edit;

     qryHistSusp.FieldByName('IDPLANOPREV').AsString := dblkpcmbBenef.lookupvalue;

     If (qryHistSusp.State = dsedit) or (qryHistSusp.State = dsinsert) then
     begin
       xQrySuspPlanPrevExistente := TwwQuery.Create(nil);
       with xQrySuspPlanPrevExistente do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add(' Select Count(1) Over() AS Qtde, ');
        Sql.Add('  IDSUSPXPLANOPREVEMPTMO,        ');
        Sql.Add('  IDPLANOPREV,                   ');
        Sql.Add('  IDPLANOPREVCONTABIL,           ');
        Sql.Add('  DTINICIO,                      ');
        Sql.Add('  DTFIM,                         ');
        Sql.Add('  FLGPRAZOINDETERMINADO,         ');
        Sql.Add('  TRGDTINCLUSAO,                 ');
        Sql.Add('  TRGUSERINCLUSAO                ');
        Sql.Add(' From suspxplanoprevemptmo       ');
        Sql.Add(' Where                           ');
        Sql.Add(' (('+QuotedStr(qryHistSusp.FieldByName('DTINICIO').AsString)+' between DTINICIO and DTFIM) ');
        Sql.Add(' or ('+QuotedStr(qryHistSusp.FieldByName('DTINICIO').AsString)+' >= DTINICIO and FLGPRAZOINDETERMINADO = 1) ');
        Sql.Add(' or ('+QuotedStr(qryHistSusp.FieldByName('DTINICIO').AsString)+' <= DTINICIO and FLGPRAZOINDETERMINADO = 1) ');
        Sql.Add(' or ('+QuotedStr(qryHistSusp.FieldByName('DTINICIO').AsString)+' <= DTINICIO))   ');
        Sql.Add(' and idplanoprev = '+qryHistSusp.FieldByName('IDPLANOPREV').AsString);
        If (qryHistSusp.State = dsedit) then
          Sql.Add(' and IDSUSPXPLANOPREVEMPTMO <> '+qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString);
        Open;
       end;

       If xQrySuspPlanPrevExistente.FieldByName('Qtde').asInteger > 0 then
       Begin
         while not (xQrySuspPlanPrevExistente.Eof) do
         begin
           //If (qryHistSusp.FieldByName('DTINICIO').AsDatetime < xQrySuspPlanPrevExistente.FieldByName('DTINICIO').AsDatetime) and (xQrySuspPlanPrevExistente.FieldByName('FLGPRAZOINDETERMINADO').AsInteger = 1) and (qryHistSusp.FieldByName('DTFIM').AsDatetime < xQrySuspPlanPrevExistente.FieldByName('DTINICIO').AsDatetime) then
           If (qryHistSusp.FieldByName('DTINICIO').AsDatetime < xQrySuspPlanPrevExistente.FieldByName('DTINICIO').AsDatetime) and (qryHistSusp.FieldByName('DTFIM').AsDatetime < xQrySuspPlanPrevExistente.FieldByName('DTINICIO').AsDatetime) and not ((qryHistSusp.FieldByName('DTINICIO').AsDatetime < xQrySuspPlanPrevExistente.FieldByName('DTINICIO').AsDatetime) and (qryHistSusp.FieldByName('FLGPRAZOINDETERMINADO').AsInteger = 1)) then
           begin
           //Continua
           end Else begin
             MsgDlg('Já existe um bloqueio cadastrado para o mesmo período.', 'Informação', mtInformation, [mbOk], 0);
             edtDataInicio.SetFocus;
             Exit;
           end;
           xQrySuspPlanPrevExistente.Next;
         end;
       End;

     End;

     If (qryHistSusp.State = dsedit) or (qryHistSusp.State = dsinsert)  then
     qryHistSusp.FieldByName('IDPLANOPREVCONTABIL').AsString := PegaMod;

     If (qryHistSusp.State = dsedit) then
     Begin
       AtualizaLog();
     End;  
  end;

  FlgIncluir := False;
  FlgExcluir := False;
  FlgEditar  := False;
  FlgGravou := True;

  AplicaAlteracoes([qryHistSusp]);

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled := False;
  bbtnSair.Enabled := True;
  bbtnAjuda.Enabled := True;

  inherited;

  Panel1.SendToBack;

  qryHistSusp.Close;
  qryHistSusp.Open;

  qryHistAlt.Close;
  qryHistAlt.ParamByName('IDPLANOPREVCONTABIL').AsInteger := qryHistSusp.FieldByName('IDPLANOPREV').AsInteger;
  qryHistAlt.ParamByName('IDSUSPXPLANOPREVEMPTMO').AsInteger := qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsInteger;
  qryHistAlt.Open;

  If not (qryHistSusp.IsEmpty) Then
  Begin
    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := True;
    sbtnApagar.Enabled := True;
    pnlFundo.Enabled := True;
  End Else Begin
    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := False;
    sbtnApagar.Enabled := False;
  End;

  bbtnCancelar.Click;

  If qryHistSusp.IsEmpty then
    lstPlaContabilMostra.Items.Clear

end;

procedure TfrmCadSuspConcPlaPrev.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

   qryHistSusp.Edit;

   PreencheModEdt();
   LancaModEdt();

   dblkpcmbBenef.Enabled := False;
   Panel1.BringToFront;
   if not (qryHistSusp.IsEmpty) then begin
      dOldDataInicial := qryHistSusp.FieldByName('DTINICIO').AsDateTime;
      dOldDataFinal   := qryHistSusp.FieldByName('DTFIM').AsDateTime;
      sOldPrazoInd    := qryHistSusp.FieldByName('FLGPRAZOINDETERMINADO').AsString;
      sOldExPlaContabil := qryHistSusp.FieldByName('IDPLANOPREVCONTABIL').AsString;
   End;

  FlgIncluir := False;
  FlgExcluir := False;
  FlgEditar  := True;
  FlgGravou := False;

end;

procedure TfrmCadSuspConcPlaPrev.sbtnInserirClick(Sender: TObject);
begin
  inherited;

    qryHistSusp.Close;
    qryHistSusp.Open;
    qryHistSusp.Insert;

    PageControl1.SendToBack;

    FlgIncluir := True;
    FlgExcluir := False;
    FlgEditar  := False;
    FlgGravou  := False;

    qryHistSusp.FieldByName('FLGPRAZOINDETERMINADO').AsInteger := 0;
    dblkpcmbBenef.Text := '';

end;

procedure TfrmCadSuspConcPlaPrev.PreencheMod;
var
   i : Integer;
   sidplanoprev : Integer;
begin

   If qryHistSusp.IsEmpty then
   Exit;

   If (qryHistSusp.State = dsinsert) then //erro
     sidplanoprev := StrToInt(dblkpcmbBenef.lookupvalue)
   else
     sidplanoprev := qryHistSusp.FieldByName('IDPLANOPREV').AsInteger;


     qryExcPlanContabil.Close;
   if not(qryExcPlanContabil.Active) then begin
     //qryExcPlanContabil.ParamByName('idplanoprevprev').AsInteger := sidplanoprev;
     qryExcPlanContabil.Open;
   end;

   // Limpa a lista
   lstPlaContabilMostra.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDMod, i);

   qryExcPlanContabil.First;
   while not(qryExcPlanContabil.EOF) do begin

      lstPlaContabilMostra.Items.Add(qryExcPlanContabil.FieldByName('nome').AsString);

      inc(i);
      SetLength(vIDMod, i);
      vIDMod[i-1] := qryExcPlanContabil.FieldByName('idplanoprev').AsInteger;

      qryExcPlanContabil.Next;
   end;
end;

function TfrmCadSuspConcPlaPrev.PegaMod: String;
var
   i        : Integer;
   sMod  : String;
begin
   inherited;

   sMod := '';

   // concatena a String de Modalidades
   for i := 0 to (lstPlaContabil.Items.Count - 1) do
   begin
      if lstPlaContabil.Checked[i] then
      begin
         if sMod <> '' then sMod := sMod + ',';
         sMod := sMod + IntToStr(vIDMod[i]);
      end;
   end;

   Result := sMod;
end;

// Editar -Incluir
procedure TfrmCadSuspConcPlaPrev.PreencheModEdt;
var
   i : Integer;
   sidplanoprev : Integer;
begin

   If qryHistSusp.IsEmpty then
   Exit;

   If (qryHistSusp.State = dsinsert) then //erro
     sidplanoprev := StrToInt(dblkpcmbBenef.lookupvalue)
   else
     sidplanoprev := qryHistSusp.FieldByName('IDPLANOPREV').AsInteger;


     qryExcPlanContabil.Close;
   if not(qryExcPlanContabil.Active) then begin
     //qryExcPlanContabil.ParamByName('idplanoprevprev').AsInteger := sidplanoprev;
     qryExcPlanContabil.Open;
   end;

   // Limpa a lista
   lstPlaContabil.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDMod, i);

   qryExcPlanContabil.First;
   while not(qryExcPlanContabil.EOF) do begin

      lstPlaContabil.Items.Add(qryExcPlanContabil.FieldByName('nome').AsString);

      inc(i);
      SetLength(vIDMod, i);
      vIDMod[i-1] := qryExcPlanContabil.FieldByName('idplanoprev').AsInteger;

      qryExcPlanContabil.Next;
   end;
end;

procedure TfrmCadSuspConcPlaPrev.wwDBGrid2CellChanged(Sender: TObject);
Var
sSQL : String;
begin
  inherited;
  If not qryHistSusp.IsEmpty then
  Begin


    qryLookPlanPrev.Close;
    qryLookPlanPrev.Open;
    qryLookPlanPrev.Locate('IDPLANOPREV',qryHistSusp.FieldByName('IDPLANOPREV').AsInteger,[]);
    if not(qryLookPlanPrev.EOF) then
    begin
       dblkpcmbBenef.LookupValue := qryHistSusp.FieldByName('IDPLANOPREV').AsString;
    end;

    qryHistAlt.Close;
    qryHistAlt.ParamByName('IDPLANOPREVCONTABIL').AsInteger := qryHistSusp.FieldByName('IDPLANOPREV').AsInteger;
    qryHistAlt.ParamByName('IDSUSPXPLANOPREVEMPTMO').AsInteger := qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsInteger;
    qryHistAlt.Open;

    If not (qryHistSusp.State = dsinsert) then
    begin
      PreencheMod();
      LancaMod();
      PreencheModEdt();
      LancaModEdt();
    End else Begin
      lstPlaContabil.Items.Clear;
    End;

  End;
end;

procedure TfrmCadSuspConcPlaPrev.dblkpcmbBenefNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  inherited;
  Accept := LookupTable.Locate('NOME', NewValue, [])
end;

procedure TfrmCadSuspConcPlaPrev.AtualizaLogExPlaContabil();
var
  xQryLog: TwwQuery;
  iLogTotalPrev: Integer;
  Lista: TStringList;
  Lista2: TStringList;
  i,i2,i3,i4,i5,countmod : Integer;
  sTemp: String;
  sChar: String;
  Branco: Boolean;
  sExpressao: String;
  qtmod : Integer;
  sDescricao:String;
  smod,smod2: string;
  moddel,modadd,bExcluido,bAdicionado : Boolean;
  qryselectmod   : twwquery;
begin
      sExpressao := strModold;
      Branco:= False;
      schar := ',';
      sExpressao := Trim(sExpressao) + sChar;
      Lista := TStringlist.Create;
      sTemp := '';
      i := 1;
      while i <= Length(sExpressao) do begin
        if (Copy(sExpressao, i, Length(sChar)) = sChar) then begin
          Inc(i,Length(sChar)-1);

          if ((sTemp = '') and (Branco)) or (sTemp <> '') then begin
            Lista.Add(sTemp);
          end;
          sTemp := '';
        end else begin
          sTemp := sTemp + Copy(sExpressao, i, 1);
        end;
          Inc(i);
      end;
              qryselectmod := TwwQuery.Create(Nil);
              qryselectmod.DatabaseName := 'BaseDados';
              qryselectmod.Close;
              qryselectmod.SQL.Clear;
              qryselectmod.SQL.Add(' SELECT DESCMODEMP FROM SUSPCONCESSAO');
              qryselectmod.Sql.Add(' WHERE IDSUCEMPTMO = '+ IntToStr(idsucemptmo)); //arrumar
              qryselectmod.Open;
              strModnew := qryselectmod.FieldByName('DESCMODEMP').asString;

      sExpressao := strModnew;
      Branco:= False;
      schar := ',';
      sExpressao := Trim(sExpressao) + sChar;
      Lista2 := TStringlist.Create;
      sTemp := '';
      i := 1;
      while i <= Length(sExpressao) do begin
        if (Copy(sExpressao, i, Length(sChar)) = sChar) then begin
          Inc(i,Length(sChar)-1);

          if ((sTemp = '') and (Branco)) or (sTemp <> '') then begin
            Lista2.Add(sTemp);
          end;
          sTemp := '';
        end else begin
          sTemp := sTemp + Copy(sExpressao, i, 1);
        end;

          Inc(i);
      end;

          moddel := false;
          // Antigo x Novo = nm excluidos
          if Lista.Text <> '' then
          begin
             for i2:= 0 to Lista.Count - 1 Do
             begin
               bExcluido := True;
               for i3:= 0 to Lista2.Count - 1 Do
               begin
                  if strtoint(Lista[i2]) = strtoint(Lista2[i3]) then
                  begin
                     bExcluido := False;
                  end;
               end;
               if (bExcluido) then begin
                 if sMod <> '' then begin
                   sMod := sMod + ', ';
                 end;
                 sMod := sMod + Lista[i2];
                 moddel := true;
               end;
             end;
          end;

          modadd := false;
          // Novo x Antigo = nm adicionados
          if Lista2.Text <> ''  then
          begin
             for i2:= 0 to Lista2.Count - 1 Do
             begin
               bAdicionado := True;
               for i3:= 0 to Lista.Count - 1 Do
               begin
                  if strtoint(Lista2[i2]) = strtoint(Lista[i3]) then
                  begin
                     bAdicionado := False;
                  end;
               end;
               if (bAdicionado) then begin
                 if sMod2 <> '' then
                 begin
                   sMod2 := sMod2 + ', ';
                 end;
                 sMod2 := sMod2 + Lista2[i2];
                 modadd := true;
               end;
             end;
          end;

    if (modadd) then begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
      begin
       dtmBaseDados.dbBaseDados.StartTransaction;
      end;
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');

      sDescricao := '';
      sDescricao := sDescricao + ' Modalidades Incluídas: ('+sMod2+')';
      sDescricao := Trim(sDescricao);

     // LOGTOTALPREV - Pesquisa1 = IDPLANOPREV / Pesquisa2 = IDSUSPXPLANOPREVEMPTMO
     xQryLog := TwwQuery.Create(nil);
     if (sDescricao <> '') then begin
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qryHistSusp.FieldByName('IDPLANOPREV').AsString+', '+qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString+')');
        ExecSql;
      end;
     end;
    end;

    if (moddel) then begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
      begin
       dtmBaseDados.dbBaseDados.StartTransaction;
      end;
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');

      sDescricao := '';
      sDescricao := sDescricao + ' Modalidades Excluídas: ('+sMod+')';
      sDescricao := Trim(sDescricao);

     // LOGTOTALPREV - Pesquisa1 = IDPLANOPREV / Pesquisa2 = IDSUSPXPLANOPREVEMPTMO
     xQryLog := TwwQuery.Create(nil);
     if (sDescricao <> '') then begin
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qryHistSusp.FieldByName('IDPLANOPREV').AsString+', '+qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString+')');
        ExecSql;
      end;
     end;
    end;

end;

procedure TfrmCadSuspConcPlaPrev.AtualizaLog();
var
  xQryLog: TwwQuery;
  iLogTotalPrev: Integer;
  sDescricao,sDescricaoOld,sDescricaoNew :String;
  strdOldDataFinal,strdNewDataFinal,strNewFLGPRAZOINDETERMINADO :String;
begin
  try

    if not dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;

    sDescricao := '';

    if (dOldDataInicial <> qryHistSuspDTINICIO.AsDateTime) then begin
      sDescricao := ' Campo: Data Início De:('+DateToStr(dOldDataInicial)+') Para:('+DateToStr(qryHistSuspDTINICIO.AsDateTime)+')';
      sDescricao := Trim(sDescricao);
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      xQryLog := TwwQuery.Create(nil);
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qryHistSusp.FieldByName('IDPLANOPREV').AsString+', '+qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString+')');
        ExecSql;
      end;
    end;

    if (dOldDataFinal <> qryHistSuspDTFIM.AsDateTime) then begin
      If dOldDataFinal = 0 then strdOldDataFinal := 'Vazio' else strdOldDataFinal := DateToStr(dOldDataFinal) ;
      If qryHistSuspDTFIM.AsDateTime = 0 then strdNewDataFinal := 'Vazio' else strdNewDataFinal := DateToStr(qryHistSuspDTFIM.AsDateTime) ;
      sDescricao := ' Campo: Data Final De:('+strdOldDataFinal+') Para:('+strdNewDataFinal+')';
      sDescricao := Trim(sDescricao);
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      xQryLog := TwwQuery.Create(nil);
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qryHistSusp.FieldByName('IDPLANOPREV').AsString+', '+qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString+')');
        ExecSql;
      end;
    end;

    if (sOldPrazoInd <> qryHistSuspFLGPRAZOINDETERMINADO.AsString) then begin
      If sOldPrazoInd = '1' then sOldPrazoInd := 'Sim' else sOldPrazoInd := 'Não' ;
      If qryHistSuspFLGPRAZOINDETERMINADO.AsString = '1' then strNewFLGPRAZOINDETERMINADO := 'Sim' else strNewFLGPRAZOINDETERMINADO := 'Não';
      sDescricao := ' Campo: Período Indeterminado De:('+sOldPrazoInd+') Para:('+strNewFLGPRAZOINDETERMINADO+')';
      sDescricao := Trim(sDescricao);
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      xQryLog := TwwQuery.Create(nil);
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qryHistSusp.FieldByName('IDPLANOPREV').AsString+', '+qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString+')');
        ExecSql;
      end;
    end;

    if (sOldExPlaContabil <> qryHistSuspIDPLANOPREVCONTABIL.AsString) then begin
      //sDescricao := ' Campo: Exceção Plano Contabil De:('+sOldExPlaContabil+') Para:('+qryHistSuspIDPLANOPREVCONTABIL.AsString+')';
      sDescricaoOld := ' Campo: Exceção Plano Contabil De:('+PegaDescExPlaContabil(sOldExPlaContabil)+')';
      sDescricaoNew := ' Campo: Exceção Plano Contabil Para:('+PegaDescExPlaContabil(qryHistSuspIDPLANOPREVCONTABIL.AsString)+')';
      sDescricaoOld := Trim(sDescricaoOld);
      sDescricaoNew := Trim(sDescricaoNew);
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      xQryLog := TwwQuery.Create(nil);
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricaoOld+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qryHistSusp.FieldByName('IDPLANOPREV').AsString+', '+qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString+')');
        ExecSql;
      end;
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      xQryLog := TwwQuery.Create(nil);
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricaoNew+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qryHistSusp.FieldByName('IDPLANOPREV').AsString+', '+qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString+')');
        ExecSql;
      end;
    end;

  finally
    if dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.Commit;
    end;
    FreeAndNil(xQryLog);
  end;
end;

procedure TfrmCadSuspConcPlaPrev.LancaMod;
var
  strMod: String;
  Lista: TStringList;
  i,i2,i3: Integer;
  sTemp: String;
  sChar: String;
  Branco: Boolean;
  sExpressao: String;
  qtmod : Integer;
  sDescricao:string;
  xQryPlanContabil: TwwQuery;
begin
   inherited;

    If (qryHistSusp.IsEmpty) or (qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString = '') then
    Exit;

      for i:= 0 to lstPlaContabilMostra.Items.Count - 1 Do
      begin
       lstPlaContabilMostra.Checked[i] := false;
      end;

      with qryitens do
      begin
        Close;
        Sql.Clear;
        Sql.Add(' SELECT IDPLANOPREVCONTABIL FROM SUSPXPLANOPREVEMPTMO ');
        Sql.Add(' WHERE IDSUSPXPLANOPREVEMPTMO = '+ qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString);
        Open;
       end;

      strMod := qryItens.FieldByName('IDPLANOPREVCONTABIL').asString;
      strModold := qryItens.FieldByName('IDPLANOPREVCONTABIL').asString;

      Branco:= False;
      schar := ',';
      sExpressao := strMod;
      sExpressao := Trim(sExpressao) + sChar;

      Lista := TStringlist.Create;
      sTemp := '';

      i := 1;
      while i <= Length(sExpressao) do begin
        if (Copy(sExpressao, i, Length(sChar)) = sChar) then begin
          Inc(i,Length(sChar)-1);

          if ((sTemp = '') and (Branco)) or (sTemp <> '') then begin
            Lista.Add(sTemp);
          end;
          sTemp := '';
        end else begin
          sTemp := sTemp + Copy(sExpressao, i, 1);
        end;

        Inc(i);
      end;

      //qtmod := lstPlaContabilMostra.Items.Count;
      i:= 0;
      i2:= 0;

      //andar pelos checks e verificar com a lista
       xQryPlanContabil := TwwQuery.Create(nil);
       with xQryPlanContabil do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add(' Select idplanoprev, nome from planprevcontabil  ');
        Sql.Add(' Where flgexclusivocontab = ''N'' and ativo = ''S''  ');
        Open;
       end;


       for i:= 0 to lstPlaContabilMostra.Items.Count - 1 Do
       begin
            sDescricao := lstPlaContabilMostra.Items[i];
            i2         := -1;

            //Saber qual é o ID conforme descricao
            xQryPlanContabil.Filtered := false;
            xQryPlanContabil.Filter   := ' nome = ' + QuotedStr(sDescricao);
            xQryPlanContabil.Filtered := true;

            if xQryPlanContabil.RecordCount > 0 then
                    i2 := xQryPlanContabil.fieldbyname('idplanoprev').Asinteger;

            //Verifica se tem o ID na StringList
            if i2 <> -1 then
            begin
             i3 := 0;
             for i3:= 0 to Lista.Count - 1 Do
             begin
                if i2 = strtoint(Lista[i3]) then
                begin
                    lstPlaContabilMostra.Checked[i] := True;
                end;
             end;

            end;
       end;
       xQryPlanContabil.Filtered := False;

end;

// Editar - Incluir
procedure TfrmCadSuspConcPlaPrev.LancaModEdt;
var
  strMod: String;
  Lista: TStringList;
  i,i2,i3: Integer;
  sTemp: String;
  sChar: String;
  Branco: Boolean;
  sExpressao: String;
  qtmod : Integer;
  sDescricao:string;
  xQryPlanContabil: TwwQuery;
begin
   inherited;

    If (qryHistSusp.IsEmpty) or (qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString = '') then
    Exit;

      for i:= 0 to lstPlaContabil.Items.Count - 1 Do
      begin
        lstPlaContabil.Checked[i] := false;
      end;

      with qryitens do
      begin
        Close;
        Sql.Clear;
        Sql.Add(' SELECT IDPLANOPREVCONTABIL FROM SUSPXPLANOPREVEMPTMO ');
        Sql.Add(' WHERE IDSUSPXPLANOPREVEMPTMO = '+ qryHistSusp.FieldByName('IDSUSPXPLANOPREVEMPTMO').AsString);
        Open;
       end;

      strMod := qryItens.FieldByName('IDPLANOPREVCONTABIL').asString;
      strModold := qryItens.FieldByName('IDPLANOPREVCONTABIL').asString;

      Branco:= False;
      schar := ',';
      sExpressao := strMod;
      sExpressao := Trim(sExpressao) + sChar;

      Lista := TStringlist.Create;
      sTemp := '';

      i := 1;
      while i <= Length(sExpressao) do begin
        if (Copy(sExpressao, i, Length(sChar)) = sChar) then begin
          Inc(i,Length(sChar)-1);

          if ((sTemp = '') and (Branco)) or (sTemp <> '') then begin
            Lista.Add(sTemp);
          end;
          sTemp := '';
        end else begin
          sTemp := sTemp + Copy(sExpressao, i, 1);
        end;

        Inc(i);
      end;

      //qtmod := lstPlaContabil.Items.Count;
      i:= 0;
      i2:= 0;

      //andar pelos checks e verificar com a lista
       xQryPlanContabil := TwwQuery.Create(nil);
       with xQryPlanContabil do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add(' Select idplanoprev, nome from planprevcontabil  ');
        Sql.Add(' Where flgexclusivocontab = ''N'' and ativo = ''S''  ');
        Open;
       end;


       for i:= 0 to lstPlaContabil.Items.Count - 1 Do
       begin
            sDescricao := lstPlaContabil.Items[i];
            i2         := -1;

            //Saber qual é o ID conforme descricao
            xQryPlanContabil.Filtered := false;
            xQryPlanContabil.Filter   := ' nome = ' + QuotedStr(sDescricao);
            xQryPlanContabil.Filtered := true;

            if xQryPlanContabil.RecordCount > 0 then
                    i2 := xQryPlanContabil.fieldbyname('idplanoprev').Asinteger;

            //Verifica se tem o ID na StringList
            if i2 <> -1 then
            begin
             i3 := 0;
             for i3:= 0 to Lista.Count - 1 Do
             begin
                if i2 = strtoint(Lista[i3]) then
                begin
                    lstPlaContabil.Checked[i] := True;
                end;
             end;

            end;
       end;
       xQryPlanContabil.Filtered := False;

end;

procedure TfrmCadSuspConcPlaPrev.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryHistSusp.Delete;

  FlgIncluir := False;
  FlgExcluir := True;
  FlgEditar  := False;
  FlgGravou := False;

  sbtnAlterar.Enabled := False;
  sbtnInserir.Enabled := False;
  bbtnConfirmar.Enabled := true;
  bbtnCancelar.Enabled := true;

  If qryHistSusp.IsEmpty then
  lstPlaContabilMostra.Items.Clear
end;

procedure TfrmCadSuspConcPlaPrev.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  dblkpcmbBenef.Enabled := True;
  Panel1.SendToBack;

  qryHistSusp.CancelUpdates;

  If not (qryHistSusp.IsEmpty) Then
  Begin
    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := True;
    sbtnApagar.Enabled := True;
    pnlFundo.Enabled := True;
  End Else Begin
    sbtnInserir.Enabled := True;
    sbtnAlterar.Enabled := False;
    sbtnApagar.Enabled := False;
  End;

end;

procedure TfrmCadSuspConcPlaPrev.CmeCadastroInsert(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadSuspConcPlaPrev.CmeCadastroConfirma(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadSuspConcPlaPrev.CmeCadastroCancel(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCadSuspConcPlaPrev.CmeCadastroEdit(Sender: TObject);
begin
  //inherited;

end;

 procedure TfrmCadSuspConcPlaPrev.dblkpcmbBenefChange(Sender: TObject);
begin
  inherited;
  if not (dblkpcmbBenef.lookupvalue = '') then
    PreencheModEdt();
end;

function TfrmCadSuspConcPlaPrev.PegaDescExPlaContabil(StrExPlaContabil : string): String;
var
  xQryLog, xQryPlanContabil, qryselectmod :TwwQuery;
  Lista, Lista2 :TStringList;
  i,i2,i3,i4,i5,countmod :Integer;
  Branco :Boolean;
  sTemp, sChar, sExpressao, sDescricao :String;
  smod,smod2: String;
begin
   inherited;

      Branco:= False;
      schar := ',';
      sExpressao := StrExPlaContabil;
      sExpressao := Trim(sExpressao) + sChar;
      Lista := TStringlist.Create;
      sTemp := '';
      i := 1;

      while i <= Length(sExpressao) do begin
        if (Copy(sExpressao, i, Length(sChar)) = sChar) then begin
          Inc(i,Length(sChar)-1);
          if ((sTemp = '') and (Branco)) or (sTemp <> '') then begin
            Lista.Add(sTemp);
          end;
          sTemp := '';
        end else begin
          sTemp := sTemp + Copy(sExpressao, i, 1);
        end;
        Inc(i);
      end;

      i:= 0;
      i2:= 0;
      //andar pelos checks e verificar com a lista
       xQryPlanContabil := TwwQuery.Create(nil);
       with xQryPlanContabil do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add(' Select idplanoprev, nome from planprevcontabil  ');
        Sql.Add(' Where flgexclusivocontab = ''N'' and ativo = ''S''  ');
        Open;
       end;

       for i:= 0 to Lista.Count - 1 Do
       begin
            sDescricao := Lista[i];
            //i2         := -1;
            //Saber qual é a descricao conforme o ID
            xQryPlanContabil.Filtered := false;
            xQryPlanContabil.Filter   := ' idplanoprev = ' + QuotedStr(sDescricao);
            xQryPlanContabil.Filtered := true;
            if xQryPlanContabil.RecordCount > 0 then begin
              if i = 0 then
                 sMod := sMod + xQryPlanContabil.fieldbyname('nome').AsString
              else
                 sMod := sMod + ', ' + xQryPlanContabil.fieldbyname('nome').AsString;
            End;
       end;
       xQryPlanContabil.Filtered := False;

       If sMod = '' then sMod := 'Vazio';

   Result := sMod;
end;

end.
