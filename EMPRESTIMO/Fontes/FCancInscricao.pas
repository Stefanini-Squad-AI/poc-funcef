{-----------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES --------------------------------------------------
------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------}

unit FCancInscricao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, StdCtrls, CheckLst, fcButton, fcImgBtn, fcShapeBtn,
  wwdblook, wwdbdatetimepicker, Mask, wwdbedit, Wwdbspin, ExtCtrls,
  fcLabel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  DBTables, Db, Wwquery, mInscricaoEmptmo, mContratoEmptmo;

type
   TfrmCancInscricao = class(TfrmSairAjudaImob)
      lblTitulo: TfcLabel;
      ntbPrincipal: TNotebook;
      Bevel3: TBevel;
      Label1: TLabel;
      Label2: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Panel1: TPanel;
      Label5: TLabel;
      edtDataInscricao: TwwDBDateTimePicker;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      btnContinuar: TfcShapeBtn;
      lstPatro: TCheckListBox;
      BitBtn2: TBitBtn;
      BitBtn1: TBitBtn;
      lstPlano: TCheckListBox;
      BitBtn3: TBitBtn;
      BitBtn4: TBitBtn;
      Bevel1: TBevel;
      btnVoltar: TfcShapeBtn;
      Panel3: TPanel;
      qryInscricaoCanc: TwwQuery;
      updInscricaoCanc: TUpdateSQL;
      fcShapeBtn1: TfcShapeBtn;
      fcShapeBtn2: TfcShapeBtn;
      molInscricaoEmptmo1: TmolInscricaoEmptmo;
      qryCancelaInscricao: TwwQuery;
      qryDeletaAvalista: TwwQuery;
      qryDeletaBenef: TwwQuery;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure BitBtn2Click(Sender: TObject);
      procedure BitBtn1Click(Sender: TObject);
      procedure BitBtn3Click(Sender: TObject);
      procedure BitBtn4Click(Sender: TObject);
      procedure fcShapeBtn1Click(Sender: TObject);
      procedure fcShapeBtn2Click(Sender: TObject);
      procedure molInscricaoEmptmo1btnBuscaContratoClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);

   private { Private declarations }

      vIDPatro, vIDPlano : array of Int64;

      procedure PreenchePatro;
      procedure MarcaTodosPatro;
      function PegaPatro: String;

      procedure PreenchePlano;
      procedure MarcaTodosPlano;
      function PegaPlano: String;

      procedure AbreQueries;

      function ContaInscricoes: Integer;

      function CancelaInscricoes: Boolean;

      procedure DeletaTabelasAuxiliares;


   public { Public declarations }

   end;



var
  frmCancInscricao: TfrmCancInscricao;



implementation
{$R *.DFM}
uses
   dBaseDados, uFuncoesEmptmo, uMensErro, DLookEmptmo, dEmptmo, uDataBase, uSistema;




procedure TfrmCancInscricao.PreenchePatro;
var
   i : Integer;
begin
   // Abre a tabela de patrocinadoras
   if not(dtmLookEmptmo.qryLookPatro.Active) then dtmLookEmptmo.qryLookPatro.Open;
   dtmLookEmptmo.qryLookPatro.First;

   // Limpa a lista
   lstPatro.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDPatro, i);

   // Preenche a listbox de patrocinadoras e o vetor...
   while not(dtmLookEmptmo.qryLookPatro.EOF) do begin

      lstPatro.Items.Add(dtmLookEmptmo.qryLookPatroNOME.AsString);

      inc(i);
      SetLength(vIDPatro, i);
      vIDPatro[i-1] := dtmLookEmptmo.qryLookPatroIDPESSOA.AsInteger;

      dtmLookEmptmo.qryLookPatro.Next;
   end;
end;



procedure TfrmCancInscricao.MarcaTodosPatro;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := True;
end;



function TfrmCancInscricao.PegaPatro: String;
var
   i        : Integer;
   sPatros  : String;
begin
   inherited;

   sPatros := '';

   // concatena a String de patros
   for i := 0 to (lstPatro.Items.Count - 1) do begin
      if lstPatro.Checked[i] then begin
         if sPatros <> '' then sPatros := sPatros + ', ';
         sPatros := sPatros + IntToStr(vIDPatro[i]);
      end;
   end;

   Result := sPatros;
end;



procedure TfrmCancInscricao.PreenchePlano;
var
   i : Integer;
begin
   // Abre a tabela de Planos
   if not(dtmLookEmptmo.qryLookPlanPrev.Active) then dtmLookEmptmo.qryLookPlanPrev.Open;
   dtmLookEmptmo.qryLookPlanPrev.First;

   // Limpa a lista
   lstPlano.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDPlano, i);

   // Preenche a listbox de planos e o vetor...
   while not(dtmLookEmptmo.qryLookPlanPrev.EOF) do begin

      lstPlano.Items.Add(dtmLookEmptmo.qryLookPlanPrevNOME.AsString);

      inc(i);
      SetLength(vIDPlano, i);
      vIDPlano[i-1] := dtmLookEmptmo.qryLookPlanPrevIDPLANOPREV.AsInteger;

      dtmLookEmptmo.qryLookPlanPrev.Next;
   end;
end;



procedure TfrmCancInscricao.MarcaTodosPlano;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;



function TfrmCancInscricao.PegaPlano: String;
var
   i        : Integer;
   sPlanos  : String;
begin
   inherited;

   sPlanos := '';

   // concatena a String de planos
   for i := 0 to (lstPlano.Items.Count - 1) do begin
      if lstPlano.Checked[i] then begin
         if sPlanos <> '' then sPlanos := sPlanos + ', ';
         sPlanos := sPlanos + IntToStr(vIDPlano[i]);
      end;
   end;

   Result := sPlanos;
end;



procedure TfrmCancInscricao.AbreQueries;
begin
   (* Tipo de Empréstimo *)
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



procedure TfrmCancInscricao.FormShow(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex  := 0;

   (* preenche a data de lançamento e o ano de referência/competência *)
   edtDataInscricao.Date   := Sysdate;

   AbreQueries;

   (* Preenche a listbox de patrocinadoras... *)
   PreenchePatro;
   (* ...e marca todas por default *)
   MarcaTodosPatro;

   (* Preenche a listbox de Planos... *)
   PreenchePlano;
   (* ...e marca todos por default *)
   MarcaTodosPlano;
end;



procedure TfrmCancInscricao.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   (* seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado *)
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;

      end else begin
         DBcboTipoContrato.Enabled := False;
      end;

   end;
end;



procedure TfrmCancInscricao.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   (* seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado *)
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;

      end else begin
         DBcboTipoContrato.Enabled := False;
      end;

   end;
end;



procedure TfrmCancInscricao.BitBtn2Click(Sender: TObject);
var
   i : Integer;
begin
   inherited;

   (* inverte a seleção *)
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := not(lstPatro.Checked[i]);
end;



procedure TfrmCancInscricao.BitBtn1Click(Sender: TObject);
begin
   inherited;
   MarcaTodosPatro;
end;



procedure TfrmCancInscricao.BitBtn3Click(Sender: TObject);
var
   i : Integer;
begin
   inherited;

   (* inverte a seleção *)
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := not(lstPlano.Checked[i]);
end;



procedure TfrmCancInscricao.BitBtn4Click(Sender: TObject);
begin
   inherited;
   MarcaTodosPlano;
end;



procedure TfrmCancInscricao.fcShapeBtn1Click(Sender: TObject);
begin
   inherited;
   CancelaInscricoes;
end;



procedure TfrmCancInscricao.fcShapeBtn2Click(Sender: TObject);
var
   sMsg     : String;
   iTotal   : Integer;
begin

   if UFuncoesEmptmo.bBuscaMutuario then
    begin
       MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                         'O usuário é o próprio mutuário do '+
                         'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
       Abort;
    end;


   sMsg  := 'ATENÇÃO!' + #13 +
            'Esse processo cancelará TODAS as Inscrições que satisfazem os filtros indicados. ' +
            'Deseja realmente prosseguir? ';

   if MsgDlg(sMsg, 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   Repaint;

   iTotal := ContaInscricoes;

   if iTotal <= 0 then begin
      MsgDlg('Não há Inscrições a cancelar com os filtros indicados. ', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;
      Exit;
   end;

   if MsgDlg('Serão canceladas ' + IntToStr(iTotal) + ' inscrições. ' + #13 + 'Deseja prosseguir?',
             'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
   Repaint;

   try
      // -------------------------------------------------------------------------------------------

      // Inicia uma transação - só se não ouver transação iniciada
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;

      // -------------------------------------------------------------------------------------------

      if CancelaInscricoes then
      begin
         // ----------------------------------------------------------------------------------------
         // Log de operações
         if not(Sistema.GravaLogOperacoes('Cancelamento de Inscrições anteriores a ' + edtDataInscricao.Text)) then
         begin
            Raise Exception.Create('Falha na gravação do Log da operação.');
         end;
         // ----------------------------------------------------------------------------------------

         CommitTransacao;

         molInscricaoEmptmo1.btnLimpaContrato.Click;

         MsgDlg('Inscrições canceladas com sucesso. ', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
      end
      else
      begin
         RollBackTransacao;
      end;

   except
      RollBackTransacao;

      Raise;
      MsgDlg('Ocorreu algum problema ao cancelar inscrições. ', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;
   end;

   Repaint;
end;



function TfrmCancInscricao.ContaInscricoes: Integer;
var
   sSql     : String;
   qryAux   : TwwQuery;
begin
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   sSQL :=
   'SELECT '                                          + #13 +
   '  COUNT(*) AS TOTAL_INSCRICOES '                  + #13 +
   'FROM '                                            + #13 +
   '  INSCRICAOEMPTMO I, '                            + #13 +
   '  CONTRATOEMPTMO C, '                             + #13 +
   '  TIPOCONTREMPTMO TC '                            + #13 +

   'WHERE '                                           + #13 +
   '  ( I.IDPLANOPREV IN ( ' + PegaPlano + ' ) ) '    + #13 +
   '  AND ( I.IDPATRO IN ( ' + PegaPatro + ' ) ) '    + #13;

   if molInscricaoEmptmo1.IDInscricao > 0 then sSQL := sSQL +
   '  AND ( I.IDINSCRICAOEMPTMO = ' + FormatFloat('#0', molInscricaoEmptmo1.IDInscricao) + ' ) ' + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then begin
   sSQL := sSQL +
   '  AND ( TC.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ' ) '         + #13;
   end;

   if DBcboTipoContrato.LookupValue <> '' then begin
   sSQL := sSQL +
   '  AND ( I.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '   + #13 +
   '  AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '  + #13;
   end;

   sSQL := sSQL +
   '  AND ( I.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                    + #13 +
   '  AND ( I.IDINSCRICAOEMPTMO = C.IDINSCRICAOEMPTMO(+) ) '                  + #13;

   try
      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;
      qryAux.Open;

      Result := qryAux.FieldByName('TOTAL_INSCRICOES').asInteger;

   finally
     qryAux.Close;
     qryAux.Free;
   end;
end;



function TfrmCancInscricao.CancelaInscricoes: Boolean;
var
   sSql     : String;
   qryAux   : TwwQuery;
begin
   Result := False;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try

      DeletaTabelasAuxiliares;

      // HistMovInscricao -----------------------------------------------------------------------------
      sSQL :=
      'DELETE FROM '                                           + #13 +
      '  HISTMOVINSCRICAO '                                    + #13 +
      'WHERE '                                                 + #13 +
      '  IDINSCRICAOEMPTMO IN '                                + #13 +
      '  ( '                                                   + #13 +
      '  SELECT '                                              + #13 +
      '     I.IDINSCRICAOEMPTMO '                              + #13 +
      '  FROM '                                                + #13 +
      '    INSCRICAOEMPTMO I, '                                + #13 +
      '    CONTRATOEMPTMO C, '                                 + #13 +
      '    TIPOCONTREMPTMO TC '                                + #13 +

      '  WHERE '                                               + #13 +
      '        ( I.IDPLANOPREV IN ( ' + PegaPlano + ' ) ) '    + #13 +
      '    AND ( I.IDPATRO IN ( ' + PegaPatro + ' ) ) '        + #13;

      if molInscricaoEmptmo1.IDInscricao > 0 then sSQL := sSQL +
      '    AND ( I.IDINSCRICAOEMPTMO = ' + FormatFloat('#0', molInscricaoEmptmo1.IDInscricao) + ' ) ' + #13;

      if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
      '    AND ( TC.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ' ) '          + #13;

      if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
      '    AND ( I.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '    + #13 +
      '    AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '   + #13;

      sSQL := sSQL +
      '    AND ( I.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                     + #13 +
      '    AND ( I.IDINSCRICAOEMPTMO = C.IDINSCRICAOEMPTMO(+) ) '                   + #13 +
      '    AND ( C.IDINSCRICAOEMPTMO IS NULL ) '                                    + #13 +
      '  ) ';

      try
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.ExecSql;
      except
         Raise;
         Exit;
      end;

      // HistMovInscricao -----------------------------------------------------------------------------


      // InscricaoEmptmo ------------------------------------------------------------------------------
      sSQL :=
      'DELETE FROM '                                           + #13 +
      '  INSCRICAOEMPTMO '                                     + #13 +
      'WHERE '                                                 + #13 +
      '  IDINSCRICAOEMPTMO IN '                                + #13 +
      '  ( '                                                   + #13 +
      '  SELECT '                                              + #13 +
      '     I.IDINSCRICAOEMPTMO '                              + #13 +
      '  FROM '                                                + #13 +
      '    INSCRICAOEMPTMO I, '                                + #13 +
      '    CONTRATOEMPTMO C, '                                 + #13 +
      '    TIPOCONTREMPTMO TC '                                + #13 +

      '  WHERE '                                               + #13 +
      '        ( I.IDPLANOPREV IN ( ' + PegaPlano + ' ) ) '    + #13 +
      '    AND ( I.IDPATRO IN ( ' + PegaPatro + ' ) ) '        + #13;

      if molInscricaoEmptmo1.IDInscricao > 0 then sSQL := sSQL +
      '    AND ( I.IDINSCRICAOEMPTMO = ' + FormatFloat('#0', molInscricaoEmptmo1.IDInscricao) + ' ) ' + #13;

      if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
      '    AND ( TC.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ' ) '          + #13;

      if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
      '    AND ( I.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '    + #13 +
      '    AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '   + #13;

      sSQL := sSQL +
      '    AND ( I.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                     + #13 +
      '    AND ( I.IDINSCRICAOEMPTMO = C.IDINSCRICAOEMPTMO(+) ) '                   + #13 +
      '    AND ( C.IDINSCRICAOEMPTMO IS NULL ) '                                    + #13 +
      '  ) ';

      try
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;
         qryAux.ExecSql;
      except
         Raise;
         Exit;
      end;

      // InscricaoEmptmo ------------------------------------------------------------------------------

      Result := True;

   finally
      qryAux.Close;
      qryAux.Free;
   end;
end;



procedure TfrmCancInscricao.molInscricaoEmptmo1btnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molInscricaoEmptmo1.btnBuscaContratoClick(Sender);
end;



procedure TfrmCancInscricao.DeletaTabelasAuxiliares;
var
  sSQL : String;
begin
   sSQL :=
   'SELECT IDINSCRICAOEMPTMO '                        + #13 +
   'FROM   INSCRICAOEMPTMO '                          + #13 +
   'WHERE '                                           + #13 +
   '  IDINSCRICAOEMPTMO IN '                          + #13 +
   '  ( '                                             + #13 +
   '  SELECT '                                        + #13 +
   '     I.IDINSCRICAOEMPTMO '                        + #13 +
   '  FROM '                                          + #13 +
   '    INSCRICAOEMPTMO I, '                          + #13 +
   '    CONTRATOEMPTMO C, '                           + #13 +
   '    TIPOCONTREMPTMO TC '                          + #13 +

   '  WHERE '                                         + #13 +
   '    ( I.IDPLANOPREV IN ( ' + PegaPlano + ' ) ) '  + #13 +
   '    AND ( I.IDPATRO IN ( ' + PegaPatro + ' ) ) '  + #13;

   if molInscricaoEmptmo1.IDInscricao > 0 then sSQL := sSQL +
   '    AND ( I.IDINSCRICAOEMPTMO = ' + FormatFloat('#0', molInscricaoEmptmo1.IDInscricao) + ' ) ' + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then begin
   sSQL := sSQL +
   '    AND ( TC.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ' ) '          + #13;
   end;

   if DBcboTipoContrato.LookupValue <> '' then begin
   sSQL := sSQL +
   '    AND ( I.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '    + #13 +
   '    AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '   + #13;
   end;

   sSQL := sSQL +
   '    AND ( I.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                     + #13 +
   '    AND ( I.IDINSCRICAOEMPTMO = C.IDINSCRICAOEMPTMO(+) ) '                   + #13 +
   '    AND ( C.IDINSCRICAOEMPTMO IS NULL ) '                                    + #13 +
   '  ) ';

   qryCancelaInscricao.Close;
   qryCancelaInscricao.Sql.Clear;
   qryCancelaInscricao.Sql.Text := sSQL;
   qryCancelaInscricao.Open;

   while not(qryCancelaInscricao.EOF) do
   begin
      LimpaParametros(qryDeletaAvalista);
      qryDeletaAvalista.ParamByName('PIDINSCRICAOEMPTMO').AsFloat := qryCancelaInscricao.FieldByName('IDINSCRICAOEMPTMO').AsFloat;
      qryDeletaAvalista.ExecSql;

      LimpaParametros(qryDeletaBenef);
      qryDeletaBenef.ParamByName('PIDINSCRICAOEMPTMO').AsFloat    := qryCancelaInscricao.FieldByName('IDINSCRICAOEMPTMO').AsFloat;
      qryDeletaBenef.ExecSql;

      qryCancelaInscricao.Next;
   end;
   qryCancelaInscricao.Close;
end;

procedure TfrmCancInscricao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  UFuncoesEmptmo.bBuscaMutuario := false; 
end;

end.
