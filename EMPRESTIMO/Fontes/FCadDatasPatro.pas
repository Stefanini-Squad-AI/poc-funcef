{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadDatasPatro;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, Wwdatsrc,
   DBTables, Wwquery, ComCtrls, Spin, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
   ImgList, fcLabel, wwdblook;


const
   iTamSitPart = 6;

   vetNomeSitPart : array[1..iTamSitPart] of String =
                  ('Patrocinadora', 'Ativo', 'Assistido', 'Mantido', 'Mantido Parcial', 'Manutenção de Saldo de Conta');

   vetCodSitPart  : array[1..iTamSitPart] of String[2] =
                  ('PT', 'AT', 'AS', 'MA', 'MP', 'MS');

type
   TfrmCadDatasPatro = class(TfrmOkCancelar)
      qryPlanPatro: TwwQuery;
      dsPlanPatro: TwwDataSource;
      pnlLeft: TPanel;
      pnlRight: TPanel;
      imGrupos: TImageList;
      qryDatas: TwwQuery;
      qryAux: TwwQuery;
      qryPlanPatroIDPLANOPREV: TFloatField;
      qryPlanPatroNOME: TStringField;
      Panel1: TPanel;
      grbNormal: TGroupBox;
      GroupBox1: TGroupBox;
      spedNormal: TSpinEdit;
      rgrpMesNormal: TRadioGroup;
      rgrpUtilNormal: TRadioGroup;
      rgrpAntNormal: TRadioGroup;
      grbAtraso: TGroupBox;
      GroupBox3: TGroupBox;
      spedAtraso: TSpinEdit;
      rgrpMesAtraso: TRadioGroup;
      rgrpUtilAtraso: TRadioGroup;
      rgrpAntAtraso: TRadioGroup;
      grbDevolucao: TGroupBox;
      grbDiaDev: TGroupBox;
      spedDevolucao: TSpinEdit;
      rgrpMesDevolucao: TRadioGroup;
      rgrpUtilDevolucao: TRadioGroup;
      rgrpAntDevolucao: TRadioGroup;
      ckbDevAProc: TCheckBox;
      grbDevDApos: TGroupBox;
      speDevDApos: TSpinEdit;
      grbCredito: TGroupBox;
      grbDiaCredito: TGroupBox;
      spedCredito: TSpinEdit;
      rgrpMesCredito: TRadioGroup;
      rgrpUtilCredito: TRadioGroup;
      rgrpAntCredito: TRadioGroup;
      ckbCredAProc: TCheckBox;
      grbCredDApos: TGroupBox;
      speCredDApos: TSpinEdit;
      trvPlanos: TTreeView;
      lstAuxTipo: TListBox;
      PnlTop: TPanel;
      DBcboPatrocinadora: TwwDBLookupCombo;
      qryPatro: TwwQuery;
      qryPatroIDPESSOA: TFloatField;
      qryPatroNOME: TStringField;
      qryPatroFLGPATROCINADORA: TFloatField;
      Label1: TLabel;

      procedure FormActivate(Sender: TObject);
      procedure trvPlanosCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
      procedure trvPlanosExpanded(Sender: TObject; Node: TTreeNode);
      procedure trvPlanosExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
      procedure trvPlanosChange(Sender: TObject; Node: TTreeNode);
      procedure FormCreate(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure rgrpUtilNormalClick(Sender: TObject);
      procedure rgrpUtilAtrasoClick(Sender: TObject);
      procedure rgrpUtilDevolucaoClick(Sender: TObject);
      procedure rgrpUtilCreditoClick(Sender: TObject);
      procedure ckbDevAProcClick(Sender: TObject);
      procedure ckbCredAProcClick(Sender: TObject);
      procedure DBcboPatrocinadoraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);

   private // Private declarations

      bValidado : boolean;

      procedure MontaTree;
      procedure PreencheDatas;
      procedure LimpaDatas;
      procedure ValidaDatasPatro;
      procedure GravaDatas;
      procedure TiraIconeSQL;
      procedure habilitaDevolucaoProcesso(bHab: Boolean);
      procedure habilitaCreditoProcesso(bHab: Boolean);
      procedure setaDevolucaoprocesso(iValor: Integer);
      procedure setaCreditoprocesso(iValor: Integer);

   public // Public declarations

   end;



var
  frmCadDatasPatro: TfrmCadDatasPatro;



implementation
{$R *.DFM}
uses
   DBaseDados,UMensErro, uSistema, FTelaAut;



procedure TfrmCadDatasPatro.MontaTree;
var
   i : Integer;
   tUltItem, tUltPlano : TTreeNode;
begin
   trvPlanos.Items.Clear;
   lstAuxTipo.Clear;
   qryPlanPatro.First;
   while not qryPlanPatro.Eof do begin
      // adicionar plano na arvore
      tUltPlano := trvPlanos.Items.Add(nil, qryPlanPatroNOME.AsString);
      lstAuxTipo.Items.Add('PL');
      // adicionar situacoes
      for i := 1 to iTamSitPart do
      begin
         tUltItem := trvPlanos.Items.AddChild(tUltPlano,vetNomeSitPart[i]);
         lstAuxTipo.Items.Add(vetCodSitPart[i]);
         tUltItem.ImageIndex := 2;
         tUltItem.SelectedIndex := 2;
      end;
      qryPlanPatro.Next;
   end;
end;//MontaTree



procedure TfrmCadDatasPatro.PreencheDatas;
var
    iItem,
    iSitSelecionada,
    iPlanoSelecionado,
    pIdPlanoPrev : Integer;
    sPlanoSelecionado,
    sNomeSitSelecionada,
    sIdSitSelecionada,
    pIdSitPart   : String;
begin
   LimpaDatas;
   iItem := 0;
   If trvPlanos.Selected <> Nil Then
     iItem := trvPlanos.Selected.AbsoluteIndex;
   if iItem < 0 // não tem nenhum item selecionado
   then iItem := 0;
   // se o usuario clicar no plano -> sair
   if lstAuxTipo.Items[iItem] = 'PL'
   then begin
     grbNormal.Visible := False;
     grbAtraso.Visible := False;
     grbDevolucao.Visible := False;
     grbCredito.Visible := False;
     bbtnConfirmar.Enabled := False;
     bbtnCancelar.Enabled := False;
     Exit;
   end;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
   grbNormal.Visible := true;
   grbAtraso.Visible := true;
   grbDevolucao.Visible := true;
   grbCredito.Visible := true;
   iSitSelecionada := iItem;
   sIdSitSelecionada := lstAuxTipo.Items[iSitSelecionada];
   sNomeSitSelecionada := trvPlanos.Items.Item[iSitSelecionada].Text;

   if trvPlanos.Selected.AbsoluteIndex < 0
   then iPlanoSelecionado := 1
   else iPlanoSelecionado := trvPlanos.Selected.Parent.AbsoluteIndex;
   sPlanoSelecionado := trvPlanos.Items.Item[iPlanoSelecionado].Text;

   // preencher parametros
   if qryPlanPatro.Locate('Nome', sPlanoSelecionado, [loCaseInsensitive, loPartialKey])
   then pIdPlanoPrev := qryPlanPatroIDPLANOPREV.AsInteger
   else pIdPlanoPrev := -1;
   pIdSitPart := sIdSitSelecionada;

   qryDatas.Close;
   qryDatas.ParamByName('IDPESSJUR').AsInteger   := qryPatroIDPESSOA.AsInteger;
   qryDatas.ParamByName('IDPLANOPREV').AsInteger := pIdPlanoPrev;
   qryDatas.ParamByName('IDSITPART').AsString    := pIdSitPart;
   qryDatas.Open;

   // preencher datas do grupo normal
   spedNormal.Text := qryDatas.FieldByName('DIACOBN').AsString;
   if qryDatas.FieldByName('FLGUTILN').AsString = 'U'
   then rgrpUtilNormal.ItemIndex := 1 //sim
   else rgrpUtilNormal.ItemIndex := 0; //não

   if qryDatas.FieldByName('FLGDIAPOSANTN').AsString = 'A' then
     rgrpAntNormal.ItemIndex := 0 // anterior
   else if qryDatas.FieldByName('FLGDIAPOSANTN').AsString = 'P' then
     rgrpAntNormal.ItemIndex := 1 // posterior
   else if qryDatas.FieldByName('FLGDIAPOSANTN').AsString = 'N' then
     rgrpAntNormal.ItemIndex := 2; // nao utilizar

   if qryDatas.FieldByName('FLGMESCOBN').AsString = 'A' then
      rgrpMesNormal.ItemIndex := 0
   else
   if qryDatas.FieldByName('FLGMESCOBN').AsString = 'C' then
      rgrpMesNormal.ItemIndex := 1
   else
      rgrpMesNormal.ItemIndex := 2;

   // preencher datas do grupo atrasado
   spedAtraso.Text := qryDatas.FieldByName('DIACOBA').AsString;
   if qryDatas.FieldByName('FLGUTILA').AsString = 'U'
   then rgrpUtilAtraso.ItemIndex := 1 //sim
   else rgrpUtilAtraso.ItemIndex := 0; //não

   if qryDatas.FieldByName('FLGDIAPOSANTA').AsString = 'A'  then
     rgrpAntAtraso.ItemIndex := 0 // anterior
   else if qryDatas.FieldByName('FLGDIAPOSANTA').AsString = 'P'  then
     rgrpAntAtraso.ItemIndex := 1 // normal
   else if qryDatas.FieldByName('FLGDIAPOSANTA').AsString = 'N'  then
     rgrpAntAtraso.ItemIndex := 2; // nao utilizar

   if qryDatas.FieldByName('FLGMESCOBA').AsString = 'A' then
      rgrpMesAtraso.ItemIndex := 0
   else
   if qryDatas.FieldByName('FLGMESCOBA').AsString = 'C' then
      rgrpMesAtraso.ItemIndex := 1
   else
      rgrpMesAtraso.ItemIndex := 2;

   // preencher datas do grupo devolucao
   spedDevolucao.Text := qryDatas.FieldByName('DIACOBD').AsString;
   if qryDatas.FieldByName('FLGUTILD').AsString = 'U'
   then rgrpUtilDevolucao.ItemIndex := 1 //sim
   else rgrpUtilDevolucao.ItemIndex := 0; //não

   if qryDatas.FieldByName('FLGDIAPOSANTD').AsString = 'A' then
      rgrpAntDevolucao.ItemIndex := 0 // anterior
   else if qryDatas.FieldByName('FLGDIAPOSANTD').AsString = 'P' then
     rgrpAntDevolucao.ItemIndex := 1 // normal
   else if qryDatas.FieldByName('FLGDIAPOSANTD').AsString = 'N' then
     rgrpAntDevolucao.ItemIndex := 2; // nao utilizar

   if qryDatas.FieldByName('FLGMESCOBD').AsString = 'A' then
      rgrpMesDevolucao.ItemIndex := 0
   else
   if qryDatas.FieldByName('FLGMESCOBD').AsString = 'C' then
      rgrpMesDevolucao.ItemIndex := 1
   else
      rgrpMesDevolucao.ItemIndex := 2;

   if Length(qryDatas.FieldByName('DIASAPOSD').AsString) <> 0 then
   begin
        habilitaDevolucaoProcesso(true);
        setaDevolucaoProcesso(qryDatas.FieldByName('DIASAPOSD').AsInteger);
   end
   else habilitaDevolucaoProcesso(false);

   // preencher datas do grupo crédito
   spedCredito.Text := qryDatas.FieldByName('DIACOBC').AsString;
   if qryDatas.FieldByName('FLGUTILC').AsString = 'U'
   then rgrpUtilCredito.ItemIndex := 1 //sim
   else rgrpUtilCredito.ItemIndex := 0; //não

   if qryDatas.FieldByName('FLGDIAPOSANTC').AsString = 'A' then
     rgrpAntCredito.ItemIndex := 0 // anterior
   else if qryDatas.FieldByName('FLGDIAPOSANTC').AsString = 'P' then
     rgrpAntCredito.ItemIndex := 1 // normal
   else if qryDatas.FieldByName('FLGDIAPOSANTC').AsString = 'N' then
     rgrpAntCredito.ItemIndex := 2; // nao utilizar

   if qryDatas.FieldByName('FLGMESCOBC').AsString = 'A' then
      rgrpMesCredito.ItemIndex := 0
   else
   if qryDatas.FieldByName('FLGMESCOBC').AsString = 'C' then
      rgrpMesCredito.ItemIndex := 1
   else
      rgrpMesCredito.ItemIndex := 2;

   if Length(qryDatas.FieldByName('DIASAPOSC').AsString) <> 0 then
   begin
        habilitaCreditoProcesso(true);
        setaCreditoProcesso(qryDatas.FieldByName('DIASAPOSC').AsInteger);
   end
   else habilitaCreditoProcesso(false);

   rgrpAntNormal.Visible    := (rgrpUtilNormal.ItemIndex = 1);
   rgrpAntAtraso.Visible    := (rgrpUtilAtraso.ItemIndex = 1);
   rgrpAntDevolucao.Visible := (rgrpUtilDevolucao.ItemIndex = 1);
   rgrpAntCredito.Visible   := (rgrpUtilCredito.ItemIndex = 1);
end;//PreencheDatas



procedure TfrmCadDatasPatro.LimpaDatas;
begin
   // preencher datas do grupo normal
   spedNormal.Value := 1;
   rgrpUtilNormal.ItemIndex := 1; //sim
   rgrpAntNormal.ItemIndex := 0; // anterior

   // preencher datas do grupo atrasado
   spedAtraso.Value := 1;
   rgrpUtilAtraso.ItemIndex := 1; //sim
   rgrpAntAtraso.ItemIndex := 0; // anterior

   // preencher datas do grupo devolucao
   spedDevolucao.Value := 1;
   rgrpUtilDevolucao.ItemIndex := 1 ;//sim
   rgrpAntDevolucao.ItemIndex := 0; // anterior
   ckbDevAProc.Checked := false; //fred - 29/06/2000.
   speDevDApos.Value   := 0; //fred - 29/06/2000.
   habilitaDevolucaoProcesso(false); //fred - 29/06/2000.

   // preencher datas do grupo credito
   spedCredito.Value := 1;
   rgrpUtilCredito.ItemIndex := 1 ;//sim
   rgrpAntCredito.ItemIndex := 0; // anterior
   ckbCredAProc.Checked := false; //fred - 29/06/2000.
   speCredDApos.Value   := 0; //fred - 29/06/2000.
   habilitaCreditoProcesso(false); //fred - 29/06/2000.
end;//LimpaDatas



procedure TfrmCadDatasPatro.ValidaDatasPatro;
var
    pIdPlanoPrev,
    i : Integer;
    sCodSitPart : String;
begin
   if not qryPlanPatro.Active then Exit;
   // verificar se todas as situacoes de todos os planos da patrocinadora
   // estão na tabela. senao -> inserir
   qryPlanPatro.First;
   while not qryPlanPatro.Eof do
   begin
      for i := 1 to iTamSitPart do
      begin
         pIdPlanoPrev := qryPlanPatroIDPLANOPREV.AsInteger;
         if lstAuxTipo.Items[i] = 'PL' then continue;
         sCodSitPart := lstAuxTipo.Items[i];
         qryDatas.Close;
         qryDatas.ParamByName('IDPESSJUR').AsInteger   := qryPatroIDPESSOA.AsInteger;
         qryDatas.ParamByName('IDPLANOPREV').AsInteger := pIdPlanoPrev;
         qryDatas.ParamByName('IDSITPART').AsString    := sCodSitPart;
         qryDatas.Open;
         if qryDatas.RecordCount = 0
         then begin //patro + plano + situacao nao está na tabela
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' INSERT INTO DATASPATROEMPTMO(IDPESSJUR,IDPLANOPREV,SITFUNDACAO, '+
                           '                             DIACOBN,FLGUTILN,FLGDIAPOSANTN, '+
                           '                             DIACOBA,FLGUTILA,FLGDIAPOSANTA, '+
                           '                             DIACOBD,FLGUTILD,FLGDIAPOSANTD, '+
                           '                             DIACOBC,FLGUTILC,FLGDIAPOSANTC) '+
                           ' VALUES ( '+ qryPatroIDPESSOA.AsString +','+IntToStr(pIdPlanoPrev)+','''+sCodSitPart+''', '+
                           '          1, ''N'', ''A'', '+
                           '          1, ''N'', ''A'', '+
                           '          1, ''N'', ''A'', '+
                           '          1, ''N'', ''A'' )');
            try
               qryAux.ExecSQL;
            except
               on E:EDBEngineError do
               begin
                  MostrarErro(E);
                  Exit;
               end;
            end; //try
         end;// if RecordCount = 0
      end;//for
      qryPlanPatro.Next;
   end;
end;//ValidaDatasPatro



procedure TfrmCadDatasPatro.GravaDatas;
var
   sSQL, sSQLWhere : String;
   iItem, iSitSelecionada, iPlanoSelecionado, pIdPlanoPrev : Integer;
   sPlanoSelecionado, sIdSitSelecionada, pIdSitPart : String;
begin
   iItem := trvPlanos.Selected.AbsoluteIndex;
   if iItem < 0 // não tem nenhum item selecionado
   then begin
//      MsgDlg('Selecione item antes desta operação', 'Erro', mtError,[mbOk,mbHelp],0);
      TiraIconeSQL;
      Exit;
   end;

   iSitSelecionada := iItem;
   sIdSitSelecionada := lstAuxTipo.Items[iSitSelecionada];

   if trvPlanos.Selected.AbsoluteIndex < 0 then
      iPlanoSelecionado := 1
   else
   if trvPlanos.Selected.Parent.AbsoluteIndex < 0 then
      iPlanoSelecionado := 0
   else
      iPlanoSelecionado := trvPlanos.Selected.Parent.AbsoluteIndex;
   sPlanoSelecionado := trvPlanos.Items.Item[iPlanoSelecionado].Text;

   // preencher parâmetros
   if qryPlanPatro.Locate('NOME', sPlanoSelecionado, [loCaseInsensitive, loPartialKey])
   then pIdPlanoPrev := qryPlanPatroIDPLANOPREV.AsInteger
   else pIdPlanoPrev := -1;
   pIdSitPart := sIdSitSelecionada;

   //preencher dados do grupo normal
   sSQL := ' DIACOBN = '+IntToStr(spedNormal.Value);
   if rgrpUtilNormal.ItemIndex = 0
   then sSQL := sSQL +', FLGUTILN = ''N''' //normal
   else sSQL := sSQL +', FLGUTILN = ''U'''; //util
   if rgrpAntNormal.ItemIndex = 0 then
      sSQL := sSQL +', FLGDIAPOSANTN = ''A''' //anterior
   else if rgrpAntNormal.ItemIndex = 1 then
      sSQL := sSQL +', FLGDIAPOSANTN = ''P'''//posterior
   else if rgrpAntNormal.ItemIndex = 2 then
      sSQL := sSQL +', FLGDIAPOSANTN = ''N'''; //não utilizar

   if rgrpMesNormal.ItemIndex = 0 then
      sSQL := sSQL + ', FLGMESCOBN = ''A'' ' //anterior
   else
   if rgrpMesNormal.ItemIndex = 1 then
      sSQL := sSQL + ', FLGMESCOBN = ''C'' ' //corrente
   else
      sSQL := sSQL + ', FLGMESCOBN = ''P'' '; //posterior

   //preencher dados do grupo atrasado
   sSQL := sSQL + ', DIACOBA = '+IntToStr(spedATRASO.Value);
   if rgrpUtilATRASO.ItemIndex = 0
   then sSQL := sSQL +', FLGUTILA = ''N''' //normal
   else sSQL := sSQL +', FLGUTILA = ''U'''; //util

   if rgrpAntATRASO.ItemIndex = 0 then
     sSQL := sSQL +', FLGDIAPOSANTA = ''A''' //anterior
   else if rgrpAntATRASO.ItemIndex = 1 then
     sSQL := sSQL +', FLGDIAPOSANTA = ''P''' //posterior
   else if rgrpAntATRASO.ItemIndex = 2 then
     sSQL := sSQL +', FLGDIAPOSANTA = ''N'''; // nao utilizar

   if rgrpMesATRASO.ItemIndex = 0 then
      sSQL := sSQL + ', FLGMESCOBA = ''A'' ' //anterior
   else
   if rgrpMesATRASO.ItemIndex = 1 then
      sSQL := sSQL + ', FLGMESCOBA = ''C'' ' //corrente
   else
      sSQL := sSQL + ', FLGMESCOBA = ''P'' '; //posterior

   //preencher dados do grupo devolucao
   sSQL := sSQL + ', DIACOBD = '+IntToStr(spedDEVOLUCAO.Value);
   if rgrpUtilDEVOLUCAO.ItemIndex = 0
   then sSQL := sSQL +', FLGUTILD = ''N''' //normal
   else sSQL := sSQL +', FLGUTILD = ''U'''; //util

   if rgrpAntDEVOLUCAO.ItemIndex = 0 then
     sSQL := sSQL +', FLGDIAPOSANTD = ''A''' //anterior
   else if rgrpAntDEVOLUCAO.ItemIndex = 1 then
     sSQL := sSQL +', FLGDIAPOSANTD = ''P''' //posterior
   else if rgrpAntDEVOLUCAO.ItemIndex = 2 then
     sSQL := sSQL +', FLGDIAPOSANTD = ''N'''; //nao utilizar

   if rgrpMesDEVOLUCAO.ItemIndex = 0 then
      sSQL := sSQL + ', FLGDIAPOSANTD = ''A'' ' //anterior
   else
   if rgrpMesDEVOLUCAO.ItemIndex = 1 then
      sSQL := sSQL + ', FLGMESCOBD = ''C'' ' //corrente
   else
      sSQL := sSQL + ', FLGMESCOBD = ''P'' '; //posterior

   if ckbDevAProc.Checked then
      sSQL := sSQL + ', DIASAPOSD = ' + IntToStr(speDevDApos.Value)
   else
      sSQL := sSQL + ', DIASAPOSD = NULL';

   //preencher dados do grupo credito
   sSQL := sSQL + ', DIACOBC = '+IntToStr(spedCREDITO.Value);
   if rgrpUtilCredito.ItemIndex = 0
   then sSQL := sSQL +', FLGUTILC = ''N''' //normal
   else sSQL := sSQL +', FLGUTILC = ''U'''; //util

   if rgrpAntCredito.ItemIndex = 0  then
     sSQL := sSQL +', FLGDIAPOSANTC = ''A''' //anterior
   else if rgrpAntCredito.ItemIndex = 1  then
     sSQL := sSQL +', FLGDIAPOSANTC = ''P''' //posterior
   else if rgrpAntCredito.ItemIndex = 2  then
     sSQL := sSQL +', FLGDIAPOSANTC = ''N'''; //nao utilizar

   if rgrpMesCredito.ItemIndex = 0 then
      sSQL := sSQL + ', FLGDIAPOSANTC = ''A'' ' //anterior
   else
   if rgrpMesCredito.ItemIndex = 1 then
      sSQL := sSQL + ', FLGMESCOBC = ''C'' ' //corrente
   else
      sSQL := sSQL + ', FLGMESCOBC = ''P'' '; //posterior

   if ckbCredAProc.Checked then
      sSQL := sSQL + ', DIASAPOSC = ' + IntToStr(speCredDApos.Value)
   else
      sSQL := sSQL + ', DIASAPOSC = NULL';

   // preencher campos chave

   sSQLWhere := ' IDPESSJUR = '+qryPatroIDPESSOA.AsString+' AND '+
                ' IDPLANOPREV =  '+IntToStr(pIdPlanoPrev)+ ' AND '+
                ' SITFUNDACAO = '''+pIdSitPart+''' ' ;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' UPDATE DATASPATROEMPTMO SET '+sSQL+
                  ' WHERE '+sSQLWhere );
   try
      qryAux.ExecSQL;

      // -------------------------------------------------------------------------------------
      // Log de operações
      if not(Sistema.GravaLogOperacoes('Cad Datas Patro: Alteração.')) then
      begin
         Raise Exception.Create('Falha na gravação do Log da operação.');
      end;
      // -------------------------------------------------------------------------------------

   except

      on E:EDBEngineError do
      begin
         MostrarErro(E);
         Exit;
      end;
   end;
end;



procedure TfrmCadDatasPatro.FormActivate(Sender: TObject);
begin
  inherited;

  qryPatro.Close;
  qryPatro.Open;

end;

procedure TfrmCadDatasPatro.trvPlanosCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  inherited;
  Node.ImageIndex := 0;
  Node.SelectedIndex := 0;

end;

procedure TfrmCadDatasPatro.trvPlanosExpanded(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  Node.ImageIndex := 1;
  Node.SelectedIndex := 1;
end;

procedure TfrmCadDatasPatro.trvPlanosExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  Node.ImageIndex := 1;
  Node.SelectedIndex := 1;
end;

procedure TfrmCadDatasPatro.FormCreate(Sender: TObject);
begin
  inherited;
  bValidado := False;
end;

procedure TfrmCadDatasPatro.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  PreencheDatas;
end;



procedure TfrmCadDatasPatro.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   GravaDatas;
//  PreencheDatas;
end;



procedure TfrmCadDatasPatro.rgrpUtilNormalClick(Sender: TObject);
begin
   inherited;
   rgrpAntNormal.Visible := (rgrpUtilNormal.ItemIndex = 0);
end;



procedure TfrmCadDatasPatro.rgrpUtilAtrasoClick(Sender: TObject);
begin
   inherited;
   rgrpAntAtraso.Visible := (rgrpUtilAtraso.ItemIndex = 0);
end;



procedure TfrmCadDatasPatro.rgrpUtilDevolucaoClick(Sender: TObject);
begin
   inherited;
   rgrpAntDevolucao.Visible := (rgrpUtilDevolucao.ItemIndex = 0);
end;



procedure TfrmCadDatasPatro.trvPlanosChange(Sender: TObject; Node: TTreeNode);
begin
   inherited;
   PreencheDatas;
end;



procedure TfrmCadDatasPatro.TiraIconeSQL;
begin
   // adaptacao para tirar o icone de SQL
   with qryAux do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM DUAL');
      Open;
      Close;
   end;
end;



procedure TfrmCadDatasPatro.rgrpUtilCreditoClick(Sender: TObject);
begin
   inherited;
   rgrpAntCredito.Visible := (rgrpUtilCredito.ItemIndex = 0);
end;



procedure TfrmCadDatasPatro.habilitaDevolucaoProcesso(bHab: Boolean);
begin
  { Habilita/desabilita o group box Dias Após. }
  grbDevDApos.Enabled := bHab;
  if grbDevDApos.Enabled then
     speDevDApos.Color := TColor(clWindow)
  else
     speDevDApos.Color := TColor(clBtnFace);

  { Verifica se está hab./desab. e torna habilitado ou não a cobrança programada. }
  grbDiaDev.Enabled         := not grbDevDApos.Enabled;
  if grbDiaDev.Enabled then
     spedDevolucao.Color   := TColor(clWindow)
  else
     spedDevolucao.Color   := TColor(clBtnFace);
  rgrpMesDevolucao.Enabled  := not grbDevDApos.Enabled;

  Repaint;
end;



procedure TfrmCadDatasPatro.ckbDevAProcClick(Sender: TObject);
begin
   inherited;
   habilitaDevolucaoProcesso(ckbDevAProc.Checked);
end;



procedure TfrmCadDatasPatro.habilitaCreditoProcesso(bHab: Boolean);
begin
   { Habilita/desabilita o group box Dias Após. }
   grbCredDApos.Enabled := bHab;
   if grbCredDApos.Enabled then
      speCredDApos.Color := TColor(clWindow)
   else
      speCredDApos.Color := TColor(clBtnFace);

   { Verifica se está hab./desab. e torna habilitado ou não a cobrança programada. }
   grbDiaCredito.Enabled := not grbCredDApos.Enabled;
   if grbDiaCredito.Enabled then
      spedCredito.Color := TColor(clWindow)
   else
      spedCredito.Color := TColor(clBtnFace);
   rgrpMesCredito.Enabled  := not grbCredDApos.Enabled;

   Repaint;
end;



procedure TfrmCadDatasPatro.setaDevolucaoprocesso(iValor: Integer);
begin
   ckbDevAProc.Checked  := True;
   speDevDApos.Value    := iValor;
end;



procedure TfrmCadDatasPatro.setaCreditoprocesso(iValor: Integer);
begin
   ckbCredAProc.Checked := True;
   speCredDApos.Value   := iValor;
end;



procedure TfrmCadDatasPatro.ckbCredAProcClick(Sender: TObject);
begin
   inherited;
   habilitaCreditoProcesso(ckbCredAProc.Checked);
end;



procedure TfrmCadDatasPatro.DBcboPatrocinadoraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   qryPlanPatro.Close;
   qryPlanPatro.ParamByName('PIDPESSJUR').AsInteger := qryPatroIDPESSOA.AsInteger;
   qryPlanPatro.Open;

   MontaTree;
   ValidaDatasPatro;
   PreencheDatas;
end;



end.
