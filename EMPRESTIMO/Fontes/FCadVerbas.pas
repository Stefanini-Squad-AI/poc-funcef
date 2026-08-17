unit FCadVerbas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, ComCtrls, StdCtrls, Db, DBTables, Wwquery,
  CmEventosCadastro, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, TB97, ExtCtrls, ImgList,
  Mask, wwdbedit;

type
  TfrmCadVerbas = class(TfrmCadastroDetalhe)
    pnlLeft: TPanel;
    lstCodigos: TListBox;
    trvArvore: TTreeView;
    qryFilial: TwwQuery;
    qryFundacao: TwwQuery;
    qryTpEmptmo: TwwQuery;
    imGrupos: TImageList;
    ListBox1: TListBox;
    qryAux: TwwQuery;
    Label4: TLabel;
    rdgTipoAlteracao: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBedtTipoEmptmo: TwwDBEdit;
    wwDBEdtFilial: TwwDBEdit;
    wwDBEdtSaldo: TwwDBEdit;
    wwDBEdtPerc: TwwDBEdit;
    dsTipEmptmo: TDataSource;
    dsFilial: TDataSource;
    qryIDVERBA: TFloatField;
    qryIDFILIAL: TFloatField;
    qryIDPATRO: TFloatField;
    qryIDTIPOEMPTMO: TFloatField;
    qryIDEMPRESAPROP: TFloatField;
    qryVLRSALDO: TFloatField;
    qryPERCDISTRIBUICAO: TFloatField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERINCLUSAO: TStringField;
    qryFundacaoIDPESSOA: TFloatField;
    qryFundacaoNOME: TStringField;
    qryTpEmptmoIDTIPOEMPTMO: TFloatField;
    qryTpEmptmoDESCTIPOEMPTMO: TStringField;
    qryTpEmptmoIDEMPRESAPROP: TFloatField;
    qryTpEmptmoIDREGRAELEG: TFloatField;
    qryTpEmptmoIDREGRAMARGEM: TFloatField;
    qryTpEmptmoIDREGRARESERVA: TFloatField;
    qryTpEmptmoTEPMAXCONTRATO: TFloatField;
    qryTpEmptmoTEPMAXINSCR: TFloatField;
    qryTpEmptmoTEPMAXPARC: TFloatField;
    qryTpEmptmoTEPMINPARC: TFloatField;
    qryTpEmptmoTEPMINQUIT: TFloatField;
    qryFilialIDPESSOA: TFloatField;
    qryFilialNOME: TStringField;
    qryFilialIDFILIALPESSOA: TFloatField;
    qrySaldoFund: TwwQuery;
    qryVerificaPerc: TwwQuery;
    procedure trvArvoreChange(Sender: TObject; Node: TTreeNode);
    procedure trvArvoreExpanded(Sender: TObject; Node: TTreeNode);
    procedure trvArvoreCollapsed(Sender: TObject; Node: TTreeNode);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sIdFund, sIdFilial, sIdTpEmp : string;
    sTpSelec                     : string;
    fSaldoAnterior               : Currency;
    fDiferenca                   : Currency;
    procedure MontaTree;
    procedure GuardaValores(NoTree:TTreeNode);
    procedure PegaVerba;
    procedure TiraIconeSQL;

    procedure AtualizaSaldosDaArvore(sTipo : string; fValor : Currency; Estado : TDataSetState);

    procedure AcertaSaldoFundacao;
    procedure AcertaSaldoTipoEmprestimo;
    procedure AcertaPercentualFilial(fValor : Currency);

    function  BuscaSaldoFundacao(const sIdFund : String) : Currency;
    function  BuscaSaldoTipoEmprestimo(const sIdFund, sIdTpEmp : String) : Currency;

    function  VerificaTotalPercentual(const sTipo, sIdTpEmp, sIdFilial : String) : Boolean;

  public
    { Public declarations }
  end;

var
  frmCadVerbas: TfrmCadVerbas;

implementation

uses UDataBase, UMensErro;

{$R *.DFM}

procedure TfrmCadVerbas.MontaTree;
var
   tNodTpEmp, tNodFilial, tNodFund : TTreeNode;
begin
   trvArvore.Items.Clear;
   lstCodigos.Clear;
   qryFundacao.Open;
   qryFundacao.First;
   while not qryFundacao.Eof do begin
      lstCodigos.Items.Add('U' + qryFundacao.FieldByName('idpessoa').AsString);
      tNodFund               := trvArvore.Items.Add(nil,qryFundacao.FieldByName('Nome').AsString);
      tNodFund.ImageIndex    := 0;
      tNodFund.SelectedIndex := 0;
      sIdFund := qryFundacao.FieldByName('idpessoa').AsString;
      qrytpEmptmo.Close;
      qryTpEmptmo.ParamByName('PIDPESSOA').AsString := sIdFund;
      qryTpEmptmo.Open;
      while not qryTpEmptmo.eof do begin
         lstCodigos.Items.Add('E' + qryTpEmptmo.FieldByName('idtipoemptmo').AsString);
         tNodTpEmp               := trvArvore.Items.AddChild(tNodFund,qryTpEmptmo.FieldbyName('desctipoemptmo').AsString);
         tNodTpEmp.ImageIndex    := 2;
         tNodTpEmp.SelectedIndex := 2;
         qryFilial.Close;
         qryFilial.ParamByName('idpessoa').AsString := sIdFund;
         qryFilial.Open;
         if not qryFilial.eof then begin
            while not qryFilial.eof do begin
               lstCodigos.Items.Add('F' + qryFilial.FieldByName('idpessoa').AsString);
               tNodFilial               := trvArvore.Items.AddChild(tNodTpEmp,qryFilial.FieldbyName('nome').AsString);
               tNodFilial.ImageIndex    := 1;
               tNodFilial.SelectedIndex := 1;
               qryFilial.Next;
            end; // while not qryfilial.eof
         end;
         qryTpEmptmo.Next;
      end; //qrytpemptmo.eof
      qryFundacao.Next;
   end;
   trvArvore.FullExpand;
   rdgTipoAlteracao.ItemIndex := 0;
end;



procedure TfrmCadVerbas.trvArvoreChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;

   if trvArvore.Selected.AbsoluteIndex < 0 then begin
      TiraIconeSQL;
      Exit;
   end;
   dsTipEmptmo.DataSet := nil;
   dsFilial.DataSet    := nil;

   GuardaValores(Node);
   PegaVerba;
end;



procedure TfrmCadVerbas.trvArvoreExpanded(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
   GuardaValores(Node);
   PegaVerba;
end;



procedure TfrmCadVerbas.trvArvoreCollapsed(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
   GuardaValores(Node);
   PegaVerba;
end;



procedure TfrmCadVerbas.GuardaValores(NoTree:TTreeNode);
var
     iNivel, ind, itam : integer;
     NoAnt : TTreeNode;
begin

   sTpSelec := Copy(lstCodigos.Items[NoTree.Level],1,1);
   iTam     := Length(lstCodigos.Items[NoTree.Level]);

   if sTpSelec = 'U' then begin
      sIdFund         := Copy(lstCodigos.Items[NoTree.AbsoluteIndex],2,iTam-1);
      sIdFilial       := '';
      sIdTpEmp        := '';
   end else if sTpSelec = 'E' then begin
      sIdTpEmp        := Copy(lstCodigos.Items[NoTree.AbsoluteIndex],2,iTam-1);
      sIdFilial       := '';
   end else if sTpSelec = 'F' then begin
      sIdFilial       := Copy(lstCodigos.Items[NoTree.AbsoluteIndex],2,iTam-1);
      sIdTpEmp        := '';
   end;

   iNivel := NoTree.Level;

   if iNivel > 0 then begin
      NoAnt  := NoTree.GetPrev;

      While NoAnt.Level = iNivel do begin
         NoAnt  := NoAnt.GetPrev;
      end;

      while NoAnt.Level <= iNivel do begin
         if (NoAnt.Level <> iNivel) then begin
            ind      := NoAnt.AbsoluteIndex;
            sTpSelec := Copy(lstCodigos.Items[ind],1,1);
            iTam     := Length(lstCodigos.Items[ind]);
            if sTpSelec = 'E' then begin
               sIdTpEmp  := Copy(lstCodigos.Items[ind],2,iTam-1);
            end else if sTpSelec = 'F' then begin
               sIdFilial := Copy(lstCodigos.Items[ind],2,iTam-1);
            end else if sTpSelec = 'U' then begin
               sIdFund   := Copy(lstCodigos.Items[ind],2,iTam-1);
            end;
         end;
         if not NoAnt.AbsoluteIndex = 0 then
            NoAnt  := NoAnt.GetPrev
         else
            Break;
      end;
   end;
end;



procedure TfrmCadVerbas.PegaVerba;
var
   sSQL : String;
begin
   qry.Close;
   sSQL := 'SELECT * '                                   + #13 +
           'FROM VERBAEMPTMO '                           + #13 +
           'WHERE IDEMPRESAPROP = ' + QuotedStr(sIdFund) + #13;

   if sIdFilial <> '' then
      sSQL := sSQL + ' AND IDFILIAL = ' +QuotedStr(sIdFilial) + #13
   else
      sSQL := sSQL + ' AND IDFILIAL IS NULL'                  + #13;

   if sIdTpEmp <> '' then
      sSQL := sSQL + ' AND IDTIPOEMPTMO = ' + QuotedStr(sIdTpEmp) + #13
   else
      sSQL := sSQL + ' AND IDTIPOEMPTMO IS NULL'                  + #13;

   qry.Sql.Clear;
   qry.SQL.Text := sSQL;
   qry.Open;

   if qryVLRSALDO.IsNull then
      fSaldoAnterior := 0
   else
      fSaldoAnterior := qryVLRSALDO.AsFloat;

end;



procedure TfrmCadVerbas.TiraIconeSQL;
begin
  with qryAux do begin
     Close;
     Open;
     Close;
  end;
end;



procedure TfrmCadVerbas.bbtnConfirmarClick(Sender: TObject);
var
   dtsState : TDataSetState;
begin
  if wwDBEdtSaldo.Text = '' then begin
     MsgDlg('Saldo para a verba deve ser informado.','Empréstimo',mtError,[mbOk],0);
     wwDBEdtSaldo.SetFocus;
     Exit;
  end;

  if qryVLRSALDO.AsFloat <= 0 then begin
     MsgDlg('Saldo para a verba deve ser informado corretamente.','Empréstimo',mtError,[mbOk],0);
     wwDBEdtSaldo.SetFocus;
     Exit;
  end;

  if wwDBEdtPerc.Text = '' then begin
     MsgDlg('Percentual de distribuição deve ser informado.','Empréstimo',mtError,[mbOk],0);
     wwDBEdtPerc.SetFocus;
     Exit;
  end;

  if (qryPERCDISTRIBUICAO.AsFloat <= 0) or
     (qryPERCDISTRIBUICAO.AsFloat > 100) then begin
     MsgDlg('Percentual de distribuição deve ser informado corretamente.','Empréstimo',mtError,[mbOk],0);
     wwDBEdtPerc.SetFocus;
     Exit;
  end;

  if rdgTipoAlteracao.ItemIndex = -1 then begin
    MsgDlg('Tipo de atualização deve ser informado.','Empréstimo',mtError,[mbOk],0);
    rdgTipoAlteracao.SetFocus;
    Exit;
  end;

   GuardaValores(trvArvore.Selected);

   sTpSelec := Copy(lstCodigos.Items[TTreeNode(trvArvore.Selected).Level],1,1);

   dtsState := qry.State;

   if qry.State = dsInsert then begin
      qryIDVERBA.AsInteger      := LeUltRegistro(qry,'VERBAEMPTMO');
      qryIDEMPRESAPROP.AsString := sIdFund;
      qryIDTIPOEMPTMO.AsString  := sIdTpEmp;
      qryIDFILIAL.AsString      := sIdFilial;
   end;

   if ( fSaldoAnterior <> 0 ) and ( fSaldoAnterior <> qryVLRSALDO.AsFloat ) then begin
      fDiferenca := qryVLRSALDO.AsFloat - fSaldoAnterior;
   end;

   inherited;

   if sTpSelec <> 'F' then  begin

      AtualizaSaldosDaArvore(sTpSelec, qryVLRSALDO.AsFloat, dtsState);

      if sTpSelec = 'E' then begin

         if dtsState = dsEdit then begin
            AcertaSaldoFundacao;
            AcertaPercentualFilial(BuscaSaldoTipoEmprestimo(sIdFund, sIdTpEmp));
         end;

      end;

   end else begin

      if dtsState = dsEdit then begin
         AcertaSaldoTipoEmprestimo;
         AcertaSaldoFundacao;
         AcertaPercentualFilial(BuscaSaldoTipoEmprestimo(sIdFund, sIdTpEmp));
      end;

   end;

   rdgTipoAlteracao.ItemIndex := 0;
end;



procedure TfrmCadVerbas.AtualizaSaldosDaArvore(sTipo : string; fValor : Currency; Estado : TDataSetState);
var
   sSQL              : String;
   fValorAtualizacao : Currency;
   fValorTotal       : Currency;
   iTotRec           : Integer;
begin
   qryAux.Close;
   sSQL := 'SELECT * '                                   + #13 +
           'FROM VERBAEMPTMO '                           + #13 +
           'WHERE IDEMPRESAPROP = ' + QuotedStr(sIdFund) + #13;

   if sTipo = 'U' then begin          // Fundação
      // Atualiza todos os niveis abaixo da fundação conforme os percentuais
      sSQL := sSQL + ' AND IDTIPOEMPTMO IS NOT NULL' + #13;

   end else if sTipo = 'E' then begin // Tipo de empréstimo
      // Atualiza todos as filiais que possuem esse tipo de empréstimo
      sSQL := sSQL + ' AND IDTIPOEMPTMO = ' + QuotedStr(sIdTpEmp) + #13 +
                     ' AND IDFILIAL IS NOT NULL' + #13;
   end;

   qryAux.Sql.Clear;
   qryAux.SQL.Text := sSQL;
   qryAux.Open;
   fValorTotal := 0;
   iTotRec     := 0;
   try
      StartTransacao;
      while not qryAux.EOF do begin
         inc(iTotRec);
         qryAux.Edit;

         fValorAtualizacao := fValor;

         if (sTipo = 'U')  and (not qryAux.FieldByName('IDFILIAL').IsNull) then begin
            fValorAtualizacao := BuscaSaldoTipoEmprestimo(sIdFund, qryAux.FieldByName('IDTIPOEMPTMO').AsString);
         end;

         qryAux.FieldByName('VLRSALDO').AsFloat := fValorAtualizacao *
                                                 ( qryAux.FieldByName('PERCDISTRIBUICAO').AsFloat / 100 );

         if (not qryAux.FieldByName('IDFILIAL').IsNull) then
            fValorTotal := fValorTotal + qryAux.FieldByName('VLRSALDO').AsFloat;

         if iTotRec = qryAux.RecordCount then
            qryAux.FieldByName('VLRSALDO').AsFloat := qryAux.FieldByName('VLRSALDO').AsFloat +
                                                      ( fValorAtualizacao - fValorTotal );

         qryAux.Post;
         qryAux.Next;
      end;
      qryAux.Close;
      CommitTransacao;
   except
      RollBackTransacao;
      MsgDlg('Não foi possível atualizar todas as verbas.','Empréstimo',mtError,[mbOk],0);
   end;
end;



procedure TfrmCadVerbas.AcertaSaldoFundacao;
var
   sSQL : String;
begin
   sSQL := 'SELECT * '                                     + #13 +
           'FROM VERBAEMPTMO '                             + #13 +
           'WHERE IDEMPRESAPROP = ' + QuotedStr(sIdFund)   + #13 +
           'AND IDTIPOEMPTMO IS NULL AND IDFILIAL IS NULL' + #13;

   qryAux.Sql.Clear;
   qryAux.SQL.Text := sSQL;
   qryAux.Open;
   qryAux.Edit;
   qryAux.FieldByName('VLRSALDO').AsFloat := qryAux.FieldByName('VLRSALDO').AsFloat + fDiferenca;
   qryAux.Post;
   qryAux.Close;

end;



procedure TfrmCadVerbas.AcertaSaldoTipoEmprestimo;
var
   sSQL : String;
begin
   sSQL := 'SELECT * '                                     + #13 +
           'FROM VERBAEMPTMO '                             + #13 +
           'WHERE IDEMPRESAPROP = ' + QuotedStr(sIdFund)   + #13 +
           'AND IDTIPOEMPTMO = ' + QuotedStr(sIdTpEmp)     + #13 +
           'AND IDFILIAL IS NULL'                          + #13;

   qryAux.Sql.Clear;
   qryAux.SQL.Text := sSQL;
   qryAux.Open;
   qryAux.Edit;

   qryAux.FieldByName('VLRSALDO').AsFloat := qryAux.FieldByName('VLRSALDO').AsFloat + fDiferenca;
   qryAux.Post;
   qryAux.Close;
end;


procedure TfrmCadVerbas.AcertaPercentualFilial(fValor : Currency);
var
   sSQL     : String;
   fTotPerc : Real;
   iTotRec  : Integer;
begin
   sSQL := 'SELECT * '                                     + #13 +
           'FROM VERBAEMPTMO '                             + #13 +
           'WHERE IDEMPRESAPROP = ' + QuotedStr(sIdFund)   + #13 +
           'AND IDTIPOEMPTMO = ' + QuotedStr(sIdTpEmp)     + #13 +
           'AND IDFILIAL IS NOT NULL'                      + #13;
   qryAux.Sql.Clear;
   qryAux.SQL.Text := sSQL;
   qryAux.Open;
   fTotPerc := 0;
   
   iTotRec  := 0;
   while not qryAux.Eof do begin
      inc(iTotRec);
      qryAux.Edit;
      qryAux.FieldByName('PERCDISTRIBUICAO').AsFloat := ( ( qryAux.FieldByName('VLRSALDO').AsFloat /
                                                            fValor ) * 100 );

      fTotPerc := fTotPerc + qryAux.FieldByName('PERCDISTRIBUICAO').AsFloat;

      if iTotREc = qryAux.RecordCount then
         qryAux.FieldByName('PERCDISTRIBUICAO').AsFloat :=  qryAux.FieldByName('PERCDISTRIBUICAO').AsFloat +
                                                            ( 100 - fTotPerc );

      qryAux.Post;
      qryAux.Next;
   end;
   qryAux.Close;
end;


procedure TfrmCadVerbas.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
   dsTipEmptmo.DataSet := nil;
   dsFilial.DataSet    := nil;


   if (sIdTpEmp <> '') and (qryTpEmptmo.Locate('IDTIPOEMPTMO', sIdTpEmp,[loCaseInsensitive])) then
      dsTipEmptmo.DataSet := qryTpEmptmo;

   if (sIdFilial <> '') and (qryFilial.Locate('IDFILIALPESSOA',sIdFilial,[loCaseInsensitive])) then
      dsFilial.DataSet    := qryFilial;
end;



procedure TfrmCadVerbas.sbtnApagarClick(Sender: TObject);
begin
  inherited;
   sbtnAlterar.Enabled := True;
   sbtnApagar.Enabled  := True;
end;



procedure TfrmCadVerbas.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   sbtnAlterar.Enabled := True;
   sbtnApagar.Enabled  := True;
end;



function TfrmCadVerbas.BuscaSaldoFundacao(const sIdFund : String) : Currency;
var
   sSQL : String;
begin

   sSQL := 'SELECT * '                                   + #13 +
           'FROM VERBAEMPTMO '                           + #13 +
           'WHERE IDEMPRESAPROP = ' + QuotedStr(sIdFund) + #13 +
           'AND   IDTIPOEMPTMO IS NULL'                  + #13 +
           'AND   IDFILIAL IS NULL '                     + #13;

   qrySaldoFund.Close;
   qrySaldoFund.Sql.Clear;
   qrySaldoFund.SQL.Text := sSQL;
   qrySaldoFund.Open;
   if not qrySaldoFund.FieldByName('VLRSALDO').IsNull then begin
      Result      := qrySaldoFund.FieldByName('VLRSALDO').AsFloat;
   end else
      Result := 0;
   qrySaldoFund.Close;
end;



function TfrmCadVerbas.BuscaSaldoTipoEmprestimo(const sIdFund, sIdTpEmp : String) : Currency;
var
   sSQL : String;
begin

   sSQL := 'SELECT * '                                   + #13 +
           'FROM VERBAEMPTMO '                           + #13 +
           'WHERE IDEMPRESAPROP = ' + QuotedStr(sIdFund) + #13 +
           'AND   IDTIPOEMPTMO = ' + QuotedStr(sIdTpEmp) + #13 +
           'AND   IDFILIAL IS NULL '                     + #13;

   qrySaldoFund.Close;
   qrySaldoFund.Sql.Clear;
   qrySaldoFund.SQL.Text := sSQL;
   qrySaldoFund.Open;
   if not qrySaldoFund.FieldByName('VLRSALDO').IsNull then begin
      Result      := qrySaldoFund.FieldByName('VLRSALDO').AsFloat;
   end else
      Result := 0;
   qrySaldoFund.Close;
end;



procedure TfrmCadVerbas.FormShow(Sender: TObject);
begin
  inherited;
   Repaint;
   Application.ProcessMessages;
   MontaTree;

end;



function TfrmCadVerbas.VerificaTotalPercentual(const sTipo, sIdTpEmp, sIdFilial : String) : Boolean;
var
    sSQL : string;
begin
   Result := True;

   BuscaSaldoFundacao(sIdFund);
   sSQL := 'SELECT SUM(PERCDISTRIBUICAO) AS PERCENTUAL FROM VERBAEMPTMO WHERE ' + #13;

   if sTipo = 'E' then begin
      sSQL := sSQL + ' ( IDTIPOEMPTMO IS NOT NULL AND IDTIPOEMPTMO <> ' + sIdTpEmp + ') AND IDFILIAL IS NULL ' + #13;
   end;

   if sTipo = 'F' then begin
      sSQL := sSQL + ' IDTIPOEMPTMO = ' + sIdTpEmp + ' AND (IDFILIAL IS NOT NULL AND IDFILIAL <> ' + sIdFilial + ')' + #13;
   end;

   with qryVerificaPerc do begin
        Close;
        Sql.Clear;
        Sql.Text := sSQL;
        Open;

        if (FieldByName('PERCENTUAL').AsFloat + qryPERCDISTRIBUICAO.AsFloat) > 100 then begin
           MsgDlg('Somatório de percentuais de distribuição ultrapassa 100%.','Empréstimo',mtWarning,[mbOk],0);
           Result := False;
        end;

        if (FieldByName('PERCENTUAL').AsFloat + qryPERCDISTRIBUICAO.AsFloat) < 100 then begin
           MsgDlg('Somatório de percentuais de distribuição inferior a 100%.','Empréstimo',mtWarning,[mbOk],0);
           Result := False;
        end;

        Close;
   end;

end;



end.
