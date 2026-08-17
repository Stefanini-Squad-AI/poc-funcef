//********************************************************************************************************
//Data	    : 23/06/2005
//Código    : Al_1
//Motivo(S) : Acerto na filtragem de Tipo de Operação Ativa da qry
//********************************************************************************************************

unit FCadDespTipoOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TB97, TabControlDetalhe, ExtCtrls, Mask, 
  TREdit, wwdblook, IvDictio, IvMulti, IvEMulti, wwdbedit, Wwdotdot,
  Wwdbcomb, DBCtrls, CmEventosCadastro, ImgList;

type
  TFrmCadDespTipoOper = class(TfrmCadMestreDetalheCS)
    QryDetalhe: TwwQuery;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDMERCADO: TFloatField;
    qryDESCTIPOOPERACAO: TStringField;
    qryNATUREZAOPERACAO: TStringField;
    qryTIPOCUSTODIA: TStringField;
    qryVENCIMENTO: TFloatField;
    Label2: TLabel;
    DbLkcDespesa: TwwDBLookupCombo;
    Label3: TLabel;
    DBLkRegraCalc: TwwDBLookupCombo;
    Label4: TLabel;
    DBLKRegraVenc: TwwDBLookupCombo;
    Bevel1: TBevel;
    QryTipoOperacao: TwwQuery;
    QryDespesa: TwwQuery;
    QryRegra: TwwQuery;
    QryRegraIDREGRA: TFloatField;
    QryRegraNOMEREGRA: TStringField;
    UpdDetalhe: TUpdateSQL;
    QryInvestimento: TwwQuery;
    QryInvestimentoIDTIPOINVEST: TFloatField;
    QryInvestimentoDESCTIPOINVEST: TStringField;
    DBLkTipoOper: TwwDBLookupCombo;
    DbLkTipoInvest: TwwDBLookupCombo;
    Label1: TLabel;
    Label5: TLabel;
    DsInvestimento: TwwDataSource;
    QryDetalheIDTIPOINVEST: TFloatField;
    QryDetalheIDTIPOOPERACAO: TFloatField;
    QryDetalheIDTIPODESPINVEST: TFloatField;
    QryDetalheIDREGRACALCDESP: TFloatField;
    QryDetalheIDREGRADATAVENC: TFloatField;
    QryDetalheFLGCALCDIARIO: TFloatField;
    QryDetalheDESCTIPODESPINV: TStringField;
    QryDespesaIDTIPODESPINVEST: TFloatField;
    QryDespesaDESCTIPODESPINV: TStringField;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DbCmbRecPag: TwwDBComboBox;
    QryDetalheFLGGERACONTAB: TFloatField;
    QryDetalheFLGGERACAPCAR: TFloatField;
    QryDetalheCODTIPDOC: TFloatField;
    QryDetalheRECPAG: TStringField;
    QryTipoDoc: TwwQuery;
    DbLkcTipoDoc: TwwDBLookupCombo;
    Label6: TLabel;
    QryTipoDocCODTIPDOC: TFloatField;
    QryTipoDocDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure DbLkTipoInvestExit(Sender: TObject);
    procedure DbLkTipoInvestChange(Sender: TObject);
    procedure DbLkTipoInvestEnter(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure DBCheckBox3Click(Sender: TObject);

    procedure FiltraTipoDoc;
    procedure DbCmbRecPagChange(Sender: TObject);

  private
    { Private declarations }
    procedure MontaRegrasPorTipodeRegra;
  public
    { Public declarations }
  end;

var   FrmCadDespTipoOper: TFrmCadDespTipoOper;

implementation

{$R *.DFM}

Uses UMensErro, UBibliotecaInvest, UOpercomum;

//-------------------------------------------------
// Mostra Formulario
procedure TFrmCadDespTipoOper.FormShow(Sender: TObject);
begin
  inherited;
// Abre Querys
  QryInvestimento.Open;
  Qry.Open;
  QryDetalhe.Open;
  QryRegra.Open;
  QryDespesa.Open;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
end;

//-------------------------------------------------
// Fecha Formulario
procedure TFrmCadDespTipoOper.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha Querys
  QryDetalhe.Close;
  QryInvestimento.Open;
  Qry.Close;
  QryDespesa.Close;
  QryTipoOperacao.Close;
  QryTipoDoc.Close;
end;
//----------------------------------------------------------
// Fazer Procura
procedure TFrmCadDespTipoOper.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
// Volta da Procura e Seta Arquivo
  If (MontaSelect.ValoresChave.Count > 0) And
     (MontaSelect.ValoresChave[0] <> '') Then Begin
    QryInvestimento.Locate('IDTIPOINVEST',MontaSelect.ValoresChave[0],[]);
    Qry.Locate('IDTIPOINVEST; IDTIPOOPERACAO',
      VarArrayOf([MontaSelect.ValoresChave[0],
                  MontaSelect.ValoresChave[1]]),[]);
    DBLkTipoInvest.Text:=QryInvestimento.FieldByName('DESCTIPOINVEST').AsString;
    DBLkTipoOper.Text  :=Qry.FieldByName('DESCTIPOOPERACAO').AsString
  End;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

//----------------------------------------------------------
// Ativa Formulario
procedure TFrmCadDespTipoOper.FormActivate(Sender: TObject);
begin
  inherited;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

end;

//----------------------------------------------------------
// Cancela Alteracao no Detalhe
procedure TFrmCadDespTipoOper.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
  sbtnInsDet.Down       := False;
  sbtnAltDet.Down       := False;
  QryDetalhe.CancelUpdates;
// Reabre a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
end;

//----------------------------------------------------------
// Volta a Alteracao no Detalhe
procedure TFrmCadDespTipoOper.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
// Reabre a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
end;

//----------------------------------------------------------
// Ok do Detalhe
procedure TFrmCadDespTipoOper.bbtnOkDetClick(Sender: TObject);
begin
// Critica Valores
  If (DbLkcDespesa.Value='') Then Begin
    ShowMessage('Faltam Preencher Valores ....');
    DbLkcDespesa.SetFocus;
    Exit;
  End;

// Caso esteja inserindo Acrecenta ID do Emissor
  If QryDetalhe.State = DsInsert Then Begin
    QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger  :=
               Qry.FieldByName('IDTIPOINVEST').AsInteger;
    QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger:=
               Qry.FieldByName('IDTIPOOPERACAO').AsInteger;
    QryDetalhe.FieldByName('FLGCALCDIARIO').AsInteger := 0;
  End;
  Try
// Heranca
//    inherited;
    QryDetalhe.Post;
    QryDetalhe.ApplyUpdates;
    QryDetalhe.CommitUpdates;
    BbtnCancelarDetClick(Application);
  Except;
    QryDetalhe.Cancel;
    QryDetalhe.CancelUpdates;
  End;
end;

//----------------------------------------------------------
// Excluir Detalhe
procedure TFrmCadDespTipoOper.sbtnExcluiDetClick(Sender: TObject);
begin
// Caso Tabela Vazia
  If QryDetalhe.IsEmpty Then Begin
    ShowMessage('Tabela esta Vazia');
// Habilita Botoes de Detalhe
    sbtnExcluiDet.Down:=False;
    Exit;
  End;

// Pede Confirmacao
  If (MsgDlg('Deseja realmente excluir este registro ?',
             'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) Then Begin
    Exit;
  End;

  Try
// Heranca
    inherited;
    QryDetalhe.ApplyUpdates;
    QryDetalhe.CommitUpdates;
  Except;
    QryDetalhe.Cancel;
    QryDetalhe.CancelUpdates;
  End;

// Habilita Botoes de Detalhe
  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

procedure TFrmCadDespTipoOper.sbtnAltDetClick(Sender: TObject);
begin
// Caso Tabela Vazia
  If QryDetalhe.IsEmpty Then Begin
    ShowMessage('Tabela esta Vazia');
    sbtnAltDet.Down := False;
    Exit;
  End;
// Herança
  inherited;
end;

procedure TFrmCadDespTipoOper.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
// Preenche Flags
  QryDetalhe.FieldByName('FLGCALCDIARIO').AsInteger := 0;
  QryDetalhe.FieldByName('FLGGERACONTAB').AsInteger := 0;
  QryDetalhe.FieldByName('FLGGERACAPCAR').AsInteger := 0;
end;

procedure TFrmCadDespTipoOper.DbLkTipoInvestExit(Sender: TObject);
begin
  inherited;
   DBLkTipoOper.Text:=Qry.FieldByName('DESCTIPOOPERACAO').AsString;
end;

procedure TFrmCadDespTipoOper.MontaRegrasPorTipodeRegra;
var sSQL : String;
begin
   QryRegra.Close;
   QryRegra.SQL.Clear;

   sSql := 'SELECT A.IDREGRA, A.NOMEREGRA FROM REGRA A';
   if QryInvestimento.FieldByName('IDTIPOINVEST').AsInteger <> 0 then
   begin
      if QryInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 1 then // Renda Fixa
      begin
         if pRPI.IDTIPOREGRARF = 0 then
            MsgDlg('Tipo de Regra de Renda Fixa não definida '+#13+
                   'no Parâmetro do Sistema.','Atenção', mtWarning, [mbOk],0)
         else
            sSql := sSql + ' WHERE IDTIPOREGRA = '+ IntToStr(pRPI.IDTIPOREGRARF);
      end
      else if QryInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 2 then // Renda Variavel
      begin
         if pRPI.IDTIPOREGRARV = 0 then
            MsgDlg('Tipo de Regra de Renda Variável não definida '+#13+
                   'no Parâmetro do Sistema.','Atenção', mtWarning, [mbOk],0)
         else
            sSql := sSql + ' WHERE IDTIPOREGRA = '+ IntToStr(pRPI.IDTIPOREGRARV);
      end
      else if (QryInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 5) or
              (QryInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 6) or
              (QryInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 7) then // Fundos
      begin
         if pRPI.IDTIPOREGRAFND = 0 then
            MsgDlg('Tipo de Regra de Fundos de Invesimentos não definida '+#13+
                   'no Parâmetro do Sistema.','Atenção', mtWarning, [mbOk],0)
         else
            sSql := sSql + ' WHERE IDTIPOREGRA = '+ IntToStr(pRPI.IDTIPOREGRAFND);
      end
      else if QryInvestimento.FieldByName('IDTIPOINVEST').AsInteger = 8 then // BM&F
      begin
         if pRPI.IDTIPOREGRABMF = 0 then
            MsgDlg('Tipo de Regra de BM&F não definida '+#13+
                   'no Parâmetro do Sistema.','Atenção', mtWarning, [mbOk],0)
         else
            sSql := sSql + ' WHERE IDTIPOREGRA = '+ IntToStr(pRPI.IDTIPOREGRABMF);
      end;
   end;
   sSql := sSql + '   ORDER BY A.NOMEREGRA';
   QryRegra.SQL.Add(sSQL);
   QryRegra.Open;
end;

procedure TFrmCadDespTipoOper.DbLkTipoInvestChange(Sender: TObject);
begin
  inherited;
  DBLkTipoOper.Text := '';
  MontaRegrasPorTipodeRegra;
end;

procedure TFrmCadDespTipoOper.DbLkTipoInvestEnter(Sender: TObject);
begin
  inherited;
  DBLkTipoInvest.Text := QryInvestimento['DESCTIPOINVEST'];
end;

procedure TFrmCadDespTipoOper.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If DBLkTipoOper.Text = '' Then
    DBLkTipoOper.Text := Qry.FieldByName('DESCTIPOOPERACAO').AsString;
end;

procedure TFrmCadDespTipoOper.DBCheckBox3Click(Sender: TObject);
begin
  inherited;
  DbCmbRecPag.Visible := DBCheckBox3.Checked;
  Label6.Visible      := DBCheckBox3.Checked;
  DbLkcTipoDoc.Visible:= DBCheckBox3.Checked;
end;

procedure TFrmCadDespTipoOper.DbCmbRecPagChange(Sender: TObject);
begin
  inherited;
  FiltraTipoDoc;

end;

procedure TFrmCadDespTipoOper.FiltraTipoDoc;
var
  sPagRecNao, sRecPag, sDebCre : string;
begin
   if (DbCmbRecPag.GetComboValue(DbCmbRecPag.Text) <> '') then begin

      sPagRecNao := DbCmbRecPag.GetComboValue(DbCmbRecPag.Text);

      case sPagRecNao[1] of
         'D': // desconto - diminui CAR
         begin
            sRecPag := 'R';
            sDebcre := 'C';
         end;
         'P': // pagamento - aumenta CAP
         begin
            sRecPag := 'P';
            sDebcre := 'C';
         end;
         'R': // recebimento - aumenta CAR
         begin
            sRecPag := 'R';
            sDebcre := 'D';
         end;
         'U': // deduçao - diminui CAP
         begin
            sRecPag := 'P';
            sDebcre := 'D';
         end;
      end;

      with QryTipoDoc do begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('RECPAG').asString := sRecPag;
         ParamByName('DEBCRE').asString := sDebCre;
         Open;
      end;

   end;
end;

end.


