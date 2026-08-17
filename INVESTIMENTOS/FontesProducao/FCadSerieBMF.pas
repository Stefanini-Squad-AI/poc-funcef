unit FCadSerieBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, TREdit, Mask, wwdbdatetimepicker, CMDateTimePicker, DBCtrls,
  wwdblook, CmEventosCadastro, ImgList,  UOperacaoInvest;

type
  TfrmCadSerieBMF = class(TfrmCadastroCS)
    dblTipoContratoInvest: TwwDBLookupCombo;
    Label13: TLabel;
    QryTipoContrato: TwwQuery;
    QryTipoContratoDESCTIPOCTINVEST: TStringField;
    lblSerie: TLabel;
    dbeSerie: TDBEdit;
    lblDataVencimento: TLabel;
    dbdDataVencimento: TCMDateTimePicker;
    dbePrecoExerc: TDBRealEdit;
    lblPrecoExerc: TLabel;
    updFilha: TUpdateSQL;
    qryFilha: TwwQuery;
    dsFilha: TwwDataSource;
    qryIDINVESTIMENTO: TFloatField;
    qryIDMOEDACONTAB: TFloatField;
    qryIDEMISSOR: TFloatField;
    qryDESCINVESTIMENTO: TStringField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOCONTRINVEST: TFloatField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryPRECOEXERC: TFloatField;
    qryFilhaIDINVESTIMENTO: TFloatField;
    qryFilhaIDMOEDACONTAB: TFloatField;
    qryFilhaIDEMISSOR: TFloatField;
    qryFilhaIDTIPOINVEST: TFloatField;
    qryFilhaDESCINVESTIMENTO: TStringField;
    QryTipoContratoIDTIPOCONTRINVEST: TFloatField;
    QryTipoContratoIDTIPOINVEST: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    function ValidaDados:boolean;
        
  private
    { Private declarations }
    procedure Sel(M,N : Longint);

  public
    { Public declarations }
  end;

var
  frmCadSerieBMF: TfrmCadSerieBMF;

implementation

{$R *.DFM}

uses uMensErro, UDataBase, dBaseDados,UBibliotecaInvest;

procedure TfrmCadSerieBMF.CmeCadastroFind(Sender: TObject);
begin
   if MontaSelect.RetornouValor then
      Sel(StrToInt(MontaSelect.ValoresChave[0]),StrToInt(MontaSelect.ValoresChave[1]));
end;

procedure TfrmCadSerieBMF.Sel(M,N : Longint);
begin
   Qry.Close;
   qryFilha.Close;

   Qry.ParamByName('P_IDINVESTIMENTO').AsInteger := M;
   Qry.ParamByName('P_IDTIPOCONTRINVEST').AsInteger := N;
   qryFilha.ParamByName('P_IDINVESTIMENTO').AsInteger := M;

   Qry.Open;
   qryFilha.Open;
end;

procedure TfrmCadSerieBMF.FormCreate(Sender: TObject);
VAR
WVAR : INTEGER;
begin
  inherited;
  Sel(-1,-1);
end;

procedure TfrmCadSerieBMF.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   // Inabilita Botoes
   sbtnInserir.Enabled:=False;
   sbtnApagar.Enabled:=False;
   sbtnAlterar.Enabled:=False;
   if dbeSerie.CanFocus then
      dbeSerie.SetFocus;
end;

procedure TfrmCadSerieBMF.bbtnConfirmarClick(Sender: TObject);
begin
   if not ValidaDados then
      exit
   else
   begin
      if qry.State = dsInsert then
        begin
          Qry.FieldByName('IDINVESTIMENTO').AsInteger :=
              LeUltRegistro(Nil,'INVESTIMENTO');

          qryFilha.Append;
          QryFilhaIDINVESTIMENTO.AsInteger  := QryIDINVESTIMENTO.AsInteger;
          qryFilhaIDTIPOINVEST.AsInteger    := QryTipoContratoIDTIPOINVEST.AsInteger;
          qryIDTIPOCONTRINVEST.AsInteger    := QryTipoContratoIDTIPOCONTRINVEST.AsInteger;

        end
      else
        qryFilha.Edit;

      qryFilhaIDEMISSOR.AsInteger       := pRPI.IDBMF;
      qryFilhaDESCINVESTIMENTO.AsString := Trim(qryDESCINVESTIMENTO.AsString);
      qryFilhaIDMOEDACONTAB.AsInteger   := pRPI.MOECODIGO;
      // Abre Transação

      // Inclui Registro

      // Posta o Registro
      if not DtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.StartTransaction;
      Try
         qryFilha.Post;
         qryFilha.ApplyUpdates;
         qry.Post;
         qry.ApplyUpdates;
         // Comita Transação
         DtmBaseDados.dbBaseDados.Commit;
      Except
         // Rollbecka Transação
         qryFilha.CancelUpdates;
         DtmBaseDados.dbBaseDados.Rollback;
         // Exibe Erro
         Raise;
            Exit;
      end;
      // Abilita Botoes
      sbtnInserir.Enabled:=True;
      sbtnApagar.Enabled:=True;
      sbtnAlterar.Enabled:=True;
      sbtnProcurar.Enabled := True;
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled := False;

      // Sobe Botoes
      sbtnInserir.Down   :=False;
      sbtnApagar.Down   :=False;
      sbtnAlterar.Down   :=False;
   end;
end;

procedure TfrmCadSerieBMF.sbtnApagarClick(Sender: TObject);
begin
  if MsgDlg('Deseja realmente apagar este registro?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if not DtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.StartTransaction;
      try
        qry.Delete;
        qryFilha.Delete;
        qry.ApplyUpdates;
        qryFilha.ApplyUpdates;
        DtmBaseDados.dbBaseDados.Commit;
        qryFilha.CommitUpdates;
        qry.CommitUpdates;
      except
        DtmBaseDados.dbBaseDados.Rollback;
        raise;
        Exit;
      end;
    end;
   // Abilita Botoes
   sbtnInserir.Enabled:=True;
   sbtnApagar.Enabled:=false;
   sbtnAlterar.Enabled:=false;
   sbtnProcurar.Enabled := True;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := False;
   // Sobe Botoes
   sbtnInserir.Down   :=False;
   sbtnApagar.Down   :=False;
   sbtnAlterar.Down   :=False;

end;

function TfrmCadSerieBMF.ValidaDados:boolean;
var
  qryTmp : TwwQuery;
begin
  inherited;
  Result := False;
  qryTmp := TwwQuery.Create(Application);
  Try
    qryTmp.DatabaseName := qry.DatabaseName;
    qryTmp.SQL.Add('SELECT I.IDINVESTIMENTO');
    qryTmp.SQL.Add('FROM');
    qryTmp.SQL.Add('SERIESBMF S, INVESTIMENTO I');
    qryTmp.SQL.Add('WHERE');
    qryTmp.SQL.Add('   S.IDINVESTIMENTO = I.IDINVESTIMENTO AND');
    qryTmp.SQL.Add('   I.DESCINVESTIMENTO = :P_DESCINVESTIMENTO');
    qryTmp.ParamByName('P_DESCINVESTIMENTO').AsString := Trim(dbeSerie.Text);
    qryTmp.Open;
    if Not qryTmp.IsEmpty Then
       begin
         MsgDlg('Investimento já existente.', 'Erro', mtError, [mbOk], 0);
         Exit;
       end;
  Finally
    qryTmp.Close;
    qryTmp.Free;
  End;

  if pRPI.IDBMF = 0 then
  begin
    MsgDlg('Emissor BM&F não preenchido nos Parâmetros de Investimento.', 'Erro', mtError, [mbOk], 0);
  end
  else if Trim(dbeSerie.Text) = '' then
  begin
    MsgDlg('Série não preenchida.', 'Erro', mtError, [mbOk], 0);
    if dbeSerie.CanFocus then
       dbeSerie.SetFocus;
  end
  else if dblTipoContratoInvest.LookupValue = '' then
  begin
    MsgDlg('Tipo de contrato não preenchido.', 'Erro', mtError, [mbOk], 0);
    if dblTipoContratoInvest.CanFocus then
       dblTipoContratoInvest.SetFocus;
  end
  else if Trim(dbdDataVencimento.Text) = '' then
  begin
     MsgDlg('Data de vencimento não preenchida.', 'Erro', mtError, [mbOk], 0);
     if dbdDataVencimento.CanFocus then
        dbdDataVencimento.SetFocus;
  end
  else if dbePrecoExerc.Text = '' then
  begin
     MsgDlg('Preço de exercício não preenchido.', 'Erro', mtError, [mbOk], 0);
     if dbePrecoExerc.CanFocus then
        dbePrecoExerc.SetFocus;
  end
  else
    Result := True;

end;

end.
