unit FPRelVerBuscaFolhaBen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CheckLst, Db, DBTables, Wwquery, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Umenserro,Usistema;

type
  TfrmPRelVerBuscaFolhaBen = class(TfrmOkCancelar)
    Panel1: TPanel;
    qryRubricas: TwwQuery;
    GroupBox2: TGroupBox;
    chklstrubricas: TCheckListBox;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cmbVersao: TwwDBLookupCombo;
    qryVersoes: TwwQuery;
    dtInicio: TCMDateTimePicker;
    Label4: TLabel;
    dtFim: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbVersaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dtInicioCloseUp(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelVerBuscaFolhaBen: TfrmPRelVerBuscaFolhaBen;
  oStrRubricas : TStringList;
implementation

uses DRelVerBuscaFolhaBen;

{$R *.DFM}

procedure TfrmPRelVerBuscaFolhaBen.FormCreate(Sender: TObject);
var
   n : Integer;
begin
  inherited;
  oStrRubricas := TStringList.Create;
  qryVersoes.Open;
  qryRubricas.Open;
  For n := 0 To QryRubricas.RecordCount -1 Do
  Begin
       chklstrubricas.Items.Add(QryRubricas.FieldByName('DESCRICAO').AsString);
       oStrRubricas.Add(QryRubricas.FieldByName('IDprovento').AsString);
       QryRubricas.Next;
   End;
end;

procedure TfrmPRelVerBuscaFolhaBen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryRubricas.close;
  qryVersoes.close;
  oStrRubricas.Destroy;
end;

procedure TfrmPRelVerBuscaFolhaBen.BitBtn1Click(Sender: TObject);
Var iTot, n : Integer;
begin
  inherited;
  // Seleciona TODOS
  iTot  := chklstrubricas.Items.Count;
  For n := 0 To (iTot-1) Do chklstrubricas.Checked[n] := True;
end;

procedure TfrmPRelVerBuscaFolhaBen.BitBtn2Click(Sender: TObject);
Var iTot, n : Integer;
begin
  inherited;
  // INVERTE Seleção
  iTot  := chklstrubricas.Items.Count;
  For n := 0 To (iTot-1) Do chklstrubricas.Checked[n] := Not chklstrubricas.Checked[n];
end;

procedure TfrmPRelVerBuscaFolhaBen.bbtnConfirmarClick(Sender: TObject);
var
   sRubrica, sVersao : String;
   n, nPos  : Integer;
begin
  inherited;

  sRubrica := '';
  sVersao  := '';

  // Verifica se vai buscar por periodo ou por versão da Folha de Beneficios.
  If ((dtInicio.text <> '') and (dtFim.Text <> '')) then
  begin
      If dtFim.Date < dtInicio.date then
      Begin
           MsgDlg('Data final não pode ser menor que a inicial.','Aviso',mtWarning,[mbOK],0);
           dtFim.date := dtInicio.date;
           dtInicio.text := '';
           dtFim.text    := '';
           exit;
      end;
  end else
  begin
       nPos := Pos('-',cmbversao.LookupValue);
       sVersao := Copy(cmbversao.LookupValue,1,npos-2);
  end;

 // Verifica se alguma Rubrica foi escolhida
  For n := 0 To (chklstrubricas.Items.Count-1) Do
  Begin
       If chklstrubricas.Checked[n] Then
       begin
          nPos := Pos('-',chklstrubricas.Items[n]);
          If sRubrica <> '' Then
             sRubrica := sRubrica + ', ' + copy(chklstrubricas.Items[n],1,nPos-1)
          Else
             sRubrica := sRubrica + copy(chklstrubricas.Items[n],1,nPos-1);
       end;
  End;

  If sRubrica = '' then
  begin
        MsgDlg('Não há nenhuma rubrica selecionada !!','Aviso',mtWarning,[mbOK],0);
        exit;
  end;


  DtmrelverbuscaFolhaBen.qryRelVerBuscaFolhaBen.Close;
  DtmrelverbuscaFolhaBen.qryRelVerBuscaFolhaBen.SQL.Clear;
  DtmrelverbuscaFolhaBen.qryRelVerBuscaFolhaBen.SQL.Add(
      ' SELECT H.IDPESSOA,	PE.NOME, PE.NUMDOCUMENTO, ''HIST.RUBRICAS'' AS ORIGEM,  '+
      ' H.IDHSTFOLHABENEF, HF.MESREFERENCIA, H.VALORPROVENTO, HF.HISTORICO,     '+
      ' PD.DESCRICAO AS NOMERUBRICA, PD.IDINFORME, I.NOMEINFORME                '+
      ' FROM HISTRUBSAL H, PESSOA PE,  HSTFOLHABENEF HF, PROVDESC PD, INFORME I '+
      ' WHERE                                                                   ');
  If ((dtInicio.text <> '') and (dtFim.text <> '')) then
  begin
      DtmrelverbuscaFolhaBen.pplbltitulo.caption := 'Período : '+DtInicio.text+' a '+DtFim.text;
      DtmrelverbuscaFolhaBen.qryRelVerBuscaFolhaBen.SQL.Add(
            ' H.DATAPAGAMENTO BETWEEN '+
            ' TO_DATE('+quotedStr(DtInicio.text)+',''DD/MM/YYYY'') AND '+
            ' TO_DATE('+quotedStr(DtFim.text)+',''DD/MM/YYYY'') ');
  end else
  begin
      DtmrelverbuscaFolhaBen.pplbltitulo.caption := 'Versão da Folha de Benefícios : '+cmbversao.lookupvalue;
      DtmrelverbuscaFolhaBen.qryRelVerBuscaFolhaBen.SQL.Add(
      ' H.IDHSTFOLHABENEF = '+sVersao);
  end;
  DtmrelverbuscaFolhaBen.qryRelVerBuscaFolhaBen.SQL.Add(
      ' AND H.IDMODULO = 18                               '+
      ' AND H.IDRUBRICA IN ('+srubrica+')                 '+
      ' AND ((H.FLGESTORNO = 0)OR (H.FLGESTORNO IS NULL)) '+
      ' AND PE.IDPESSOA = H.IDPESSOA                      '+
      ' AND H.VALORPROVENTO > 0                           '+
      ' AND H.IDHSTFOLHABENEF = HF.IDHSTFOLHABENEF        '+
      ' AND PD.IDPROVENTO = H.IDRUBRICA                   '+
      ' AND I.IDINFORME = PD.IDINFORME                    '+

      ' UNION                                             '+

       ' SELECT L.IDBENEFIRRF AS IDPESSOA, PE.NOME, PE.NUMDOCUMENTO,    '+
       '''IRRF'' AS ORIGEM, L.IDHSTFOLHABENEF, 	HF.MESREFERENCIA,       '+
       ' L.VLRIRRF AS VALORPROVENTO, HF.HISTORICO, '''' AS NOMERUBRICA, '+
       ' TO_NUMBER(''0'') AS IDINFORME, '''' AS NOMEINFORME             '+
       ' FROM LANCIRRF L, 	PESSOA PE, HSTFOLHABENEF HF             '+
       ' WHERE                                                          ');
  If ((dtInicio.text <> '') and (dtFim.text <> '')) then
  Begin
      DtmrelverbuscaFolhaBen.qryRelVerBuscaFolhaBen.SQL.Add(
      ' L.DATALANCAMENTO BETWEEN                                 '+
      ' TO_DATE('+quotedStr(DtInicio.text)+',''DD/MM/YYYY'') AND '+
      ' TO_DATE('+quotedStr(DtFim.text)+',''DD/MM/YYYY'')        ');
  end else
  begin
      DtmrelverbuscaFolhaBen.qryRelVerBuscaFolhaBen.SQL.Add(
      ' L.IDHSTFOLHABENEF = '+sVersao);
  end;
  DtmrelverbuscaFolhaBen.qryRelVerBuscaFolhaBen.SQL.Add(
       ' AND L.IDMODULO = 18                                 '+
       ' AND L.CODNATUREZA = ''0561''                        '+
       ' AND L.IDBENEFIRRF = PE.IDPESSOA                     '+
       ' AND L.VLRIRRF > 0                                   '+
       ' AND L.IDHSTFOLHABENEF = HF.IDHSTFOLHABENEF          '+
       ' ORDER BY NOME,IDHSTFOLHABENEF,ORIGEM,VALORPROVENTO');
   DtmrelverbuscaFolhaBen.qryRelVerBuscaFolhaBen.Open;

   DtmrelverbuscaFolhaBen.qryFundacao.Close;
   DtmrelverbuscaFolhaBen.qryFundacao.ParamByName('pFundacao').AsInteger := Sistema.IdEmpresa;
   DtmrelverbuscaFolhaBen.qryFundacao.Open;

end;



procedure TfrmPRelVerBuscaFolhaBen.cmbVersaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dtInicio.text := '';
  dtFim.text    := '';
end;

procedure TfrmPRelVerBuscaFolhaBen.dtInicioCloseUp(Sender: TObject);
begin
  inherited;
  cmbversao.Text := '';
end;

procedure TfrmPRelVerBuscaFolhaBen.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dtInicio.text := '';
  dtFim.text    := '';
  cmbversao.Text := '';
end;

end.
