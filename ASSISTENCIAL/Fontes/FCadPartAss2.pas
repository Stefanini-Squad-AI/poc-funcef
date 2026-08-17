unit FCadPartAss2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, DBCtrls, StdCtrls, Db, DBTables, Wwquery,
  CmEventosCadastro, ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CheckLst, DBGrids;

type
  TFrmCadPartAss = class(TfrmCadMestreDetalheCS)
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    lblFalecido: TLabel;
    Label9: TLabel;
    dbtMatricula: TDBText;
    dbtInscricao: TDBText;
    dbtNomeParticip: TDBText;
    dbtDepend: TDBText;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbtPatro: TDBText;
    dbtSituacao: TDBText;
    dbtPlano: TDBText;
    dbtDataInscricao: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbtNasc: TDBText;
    dbtSexo: TDBText;
    dbtEstCivil: TDBText;
    dbtBanco: TDBText;
    dbtConta: TDBText;
    Label14: TLabel;
    dbtEndCompleto: TDBText;
    qryDet: TwwQuery;
    qryPlanos: TwwQuery;
    qryPlanosIDPLANASS: TFloatField;
    qryPlanosNOME: TStringField;
    qryPlanosOPCAOAIDENT: TStringField;
    qryPlanosOPCAOBDIF: TStringField;
    qryPlanosCODPORTFORMA: TFloatField;
    BitBtn1: TBitBtn;
    chkContrib: TCheckListBox;
    dblkPlano: TwwDBLookupCombo;
    Label15: TLabel;
    dbtpDataInscricao: TwwDBDateTimePicker;
    Label49: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    GroupBox1: TGroupBox;
    chkOpcaoA: TDBCheckBox;
    qrySitPlanoAss: TwwQuery;
    Label17: TLabel;
    dblkSitPlanoAss: TwwDBLookupCombo;
    updDet: TUpdateSQL;
    qryContass: TwwQuery;
    dsContass: TwwDataSource;
    updContass: TUpdateSQL;
    edtCobra: TEdit;
    qryAux: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
  private
    procedure FormaCobranca;
    procedure MontaPlanos(piFlagInsert:Integer);
    procedure MontaContribuicoes(piFlagInsert:Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPartAss: TFrmCadPartAss;

implementation

uses uMensErro, UDataBase;

{$R *.DFM}

procedure TFrmCadPartAss.FormaCobranca;
begin
  If qry.FieldByName('FLGINTERNO').AsString = 'AT'
   Then edtCobra.Text := 'FOLHA DE PAGAMENTO'
   Else If qry.FieldByName('FLGINTERNO').AsString = 'AS'
         Then edtCobra.Text := 'FOLHA DE BENEFÍCIO'
         Else If (qry.FieldByName('FLGINTERNO').AsString = 'MA') Or
                 (qry.FieldByName('FLGINTERNO').AsString = 'MP')
               Then edtCobra.Text := 'BOLETO BANCÁRIO';
end;

procedure TFrmCadPartAss.MontaPlanos(piFlagInsert: Integer);
begin
  With qryPlanos do
   Begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT IDPLANASS, NOME, OPCAOAIDENT, OPCAOBDIF, CODPORTFORMA');
     SQL.Add('FROM PLANASS');
     SQL.Add('WHERE FLGATIVO = 1');
     If piFlagInsert = 1
      Then Begin
        SQL.Add('  AND IDPLANASS NOT IN (SELECT P.IDPLANASS');
        SQL.Add('                        FROM PARTASS P, BENEFASS BA,');
        SQL.Add('                             PLANPREV PP, PLANASS PA,');
        SQL.Add('                             SITPLANOASS S');
        SQL.Add('                        WHERE (P.IDPESSOA = '+qry.FieldByName('IDPESSOA').AsString+')');
        SQL.Add('                          AND (P.FLGINSCRICAOCANC = 0) ');
        SQL.Add('                          AND (P.IDPESSOA = BA.IDTITULAR(+))');
        SQL.Add('                          AND (P.IDPESSJUR = BA.IDPESSJUR(+))');
        SQL.Add('                          AND (P.IDPLANOPREV = BA.IDPLANOPREV(+))');
        SQL.Add('                          AND (P.IDPLANASS = BA.IDPLANASS(+))');
        SQL.Add('                          AND (P.IDPESSOA = BA.IDDEPENDENTE(+))');
        SQL.Add('                          AND (P.SEQPROPOSTA = BA.SEQPROPOSTA(+))');
        SQL.Add('                          AND (P.IDPLANASS = PA.IDPLANASS)');
        SQL.Add('                          AND (P.IDPLANOPREV = PP.IDPLANOPREV)');
        SQL.Add('                          AND (P.IDSITPART= S.IDSITPLANOASS)  )');
      End;
     Open;
   End;
end;

procedure TFrmCadPartAss.MontaContribuicoes(piFlagInsert: Integer);
Var
 i : Integer;
begin
  With qryAux do
   Begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT DISTINCT CB.IDCONTASS, CT.NOME,');
     SQL.Add('       DECODE(CA.IDCONTASS, NULL, 0, 1) FLGPAGA');
     SQL.Add('FROM CONTRIBASS CB, CONTRIBUICAO CT,');
     SQL.Add('     (SELECT C.IDPLANASS, C.IDCONTASS');
     SQL.Add('      FROM CONTASS C');
     SQL.Add('      WHERE C.IDPLANOPREV  = '+qry.FieldByName('IDPLANOPREV').AsString);
     SQL.Add('        AND C.IDPESSJUR    = '+qry.FieldByName('IDPESSJUR').AsString);
     SQL.Add('        AND C.IDTITULAR    = '+qry.FieldByName('IDPESSOA').AsString);
     SQL.Add('        AND C.IDDEPENDENTE = '+qry.FieldByName('IDPESSOA').AsString);
     If piFlagInsert = 1
      Then SQL.Add('        AND C.IDPLANASS    = -1')
      Else SQL.Add('        AND C.IDPLANASS    = '+qryDet.FieldByName('IDPLANASS').AsString);
     SQL.Add('        AND C.SEQPROPOSTA  = '+qryDet.ParamByName('SEQPROPOSTA').AsString+') CA');
     SQL.Add('WHERE CB.IDCONTASS = CT.IDCONTRIBUICAO');
     SQL.Add('  AND CB.IDCONTASS = CA.IDCONTASS (+)');
     SQL.Add('ORDER BY CT.NOME');

     Open;

     chkContrib.Items.Clear;
     i := 0;
     While Not Eof do
      Begin
       chkContrib.Items.Add(Trim(FieldByName('NOME').AsString));
       chkContrib.Checked[i] := (FieldByName('FLGPAGA').AsInteger = 1);
       Inc(i);
       Next;
      End;
   End;
end;

procedure TFrmCadPartAss.FormShow(Sender: TObject);
begin
  inherited;
  // Abertura das queries
  qry.ParamByName('IDPESSOA').AsInteger       := -1;
  qry.Open;

  qryDet.ParamByName('IDPESSJUR').AsInteger   := -1;
  qryDet.ParamByName('SEQPROPOSTA').AsInteger := -1;
  qryDet.ParamByName('IDPLANOPREV').AsInteger := -1;
  qryDet.ParamByName('IDPESSOA').AsInteger    := -1;
  qryDet.Open;

  qryPlanos.ParamByName('IDPESSOA').AsInteger := -1;
  qryPlanos.Open;

  qrySitPlanoAss.Open;

  // limpando Variáveis
  lblFalecido.Caption := '';
  edtCobra.Text := '';
end;

procedure TFrmCadPartAss.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor
   Then Begin
     // Verifica se o participante é pensionista e não possui Nucleo Familiar
     If (MontaSelect.ValoresChave[2] = '') and (MontaSelect.ValoresChave[3] <> '')
      Then Begin
        MsgDlg('O participante é falecido e não tem responsável'+#13+
               'pelo grupo  familiar  cadastrado. É  necessário'+#13+
               'primeiro cadastrar NUCLEO FAMILIAR.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
        Abort;
      End;
      // Abertura das queries
      qry.Close;
      qry.ParamByName('IDPESSOA').AsInteger       := StrToInt(MontaSelect.ValoresChave[1]);
      qry.Open;

      qryDet.Close;
      qryDet.ParamByName('IDPESSJUR').AsInteger   := StrToInt(MontaSelect.ValoresChave[4]);
      qryDet.ParamByName('SEQPROPOSTA').AsInteger := StrToInt(MontaSelect.ValoresChave[6]);
      qryDet.ParamByName('IDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[5]);
      qryDet.ParamByName('IDPESSOA').AsInteger    := StrToInt(MontaSelect.ValoresChave[1]);
      qryDet.Open;

      qryPlanos.Close;
      qryPlanos.ParamByName('IDPESSOA').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
      qryPlanos.Open;

      // Participante Falecido
      If qry.FieldByName('IDRESPONSAVEL').asString <> ''
       Then lblFalecido.Caption:='Falecido: '+qry.FieldByName('NOME').AsString
       Else lblFalecido.Caption:='';
   End;
end;

procedure TFrmCadPartAss.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  FormaCobranca;                 
  MontaPlanos(1);
  MontaContribuicoes(1);
end;

procedure TFrmCadPartAss.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  FormaCobranca;
  MontaPlanos(0); 
  MontaContribuicoes(0);
end;

end.
