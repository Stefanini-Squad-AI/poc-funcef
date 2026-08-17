unit fLgLayout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Wwdbigrd, Wwdbgrid,
  DBCtrls, Grids, DBGrids, Db, DBTables, Wwquery, Wwdatsrc, Menus, FTelaAut,
  TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti, IvEMulti, Wwdbgrd2,
  wwdblook;

type
  TfrmLgLayout = class(TfrmSairAjuda)
    qryTpLayout: TwwQuery;
    dsTpLayout: TwwDataSource;
    qryCpLayout: TwwQuery;
    dsCpLayout: TwwDataSource;
    qryLgLayout: TwwQuery;
    dsLgLayout: TwwDataSource;
    qryIns: TwwQuery;
    qryCpLayoutIDLAYOUT: TFloatField;
    qryCpLayoutIDCPLAYOUT: TFloatField;
    qryCpLayoutNOMECPO: TStringField;
    qryCpLayoutPOSINICIAL: TFloatField;
    qryCpLayoutPOSFINAL: TFloatField;
    qryCpLayoutFLGVALOR: TStringField;
    qryTpLayoutIDLAYOUT: TFloatField;
    qryTpLayoutDESCRICAO: TStringField;
    qrytabela: TwwQuery;
    qryLgLayoutIDLAYOUT: TFloatField;
    qryLgLayoutIDCPLAYOUT: TFloatField;
    qryLgLayoutIDLGLAYOUT: TFloatField;
    qryLgLayoutDESCASSOC: TStringField;
    GroupBox2: TGroupBox;
    dbgLgLayout: TwwDBGrid;
    qryLgLayoutCONTEUDO: TStringField;
    Panel1: TPanel;
    gbDestino: TGroupBox;
    cbArquivo: TComboBox;
    gbDescLayout: TGroupBox;
    dblktipo: TwwDBLookupCombo;
    Panel2: TPanel;
    cbCampoDisponivel: TComboBox;
    dblkCampoLayout: TwwDBLookupCombo;
    EditConteudo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    LabelTitObs: TLabel;
    LabelObs: TLabel;
    cbFormato: TComboBox;
    Label4: TLabel;
    btnColocar: TBitBtn;
    btnRetirar: TBitBtn;
    Label5: TLabel;
    qryLgLayoutPOSINICIAL: TFloatField;
    qryLgLayoutPOSFINAL: TFloatField;
    chkConteudoFixo: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbArquivoClick(Sender: TObject);
    procedure dblktipoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkCampoLayoutCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnColocarClick(Sender: TObject);
    procedure btnRetirarClick(Sender: TObject);
    procedure chkConteudoFixoClick(Sender: TObject);
  private
      { Private declarations }
      procedure InsereNomesFan;
      procedure AbreqryLgLayout;
      //procedure InsereObs;
  public
    { Public declarations }
  end;

var
  frmLgLayout: TfrmLgLayout;
  iIdLgLayout: Integer;
  sNomeArq,
  sSql,
  sIdLayout,
  sIdCpLayout,
  sIdLgLayout,
  sCampoArq,
  sTipoArq: String;

implementation

uses UMensErro, UAdmAss, USistema, DBaseDados, UDataBase, ULayoutAss;

{$R *.DFM}

procedure TFrmLgLayout.InsereNomesFan;
Var A: Integer;
begin
  inherited;
  (* Insere o nomes fantasia no ComboBox *)
  cbCampoDisponivel.Items.Clear;
  (* 0 = TABELA CAPSEGASS *)
  Case cbArquivo.ItemIndex Of
    0: For A:=0 to NCp0 do cbCampoDisponivel.Items.Add(TabCamposFan0[A]);
    1: begin
         If (Trim(qryCpLayout.FieldByName('NOMECPO').AsString)='HEADER')Or
             (Trim(qryCpLayout.FieldByName('NOMECPO').AsString)='TRAILER') then
            For A:=0 to NCp2 do cbCampoDisponivel.Items.Add(TabCamposFan2[A])
         else For A:=0 to NCp1 do cbCampoDisponivel.Items.Add(TabCamposFan1[A]);
       end;
    //2: For A:=0 to NCp3 do cbCampoDisponivel.Items.Add(TabCamposFan3[A]);
  end; {Case}
end;

procedure TfrmLgLayout.FormCreate(Sender: TObject);
Var A: Integer;
begin
  inherited;
  qryTpLayout.Open;
  qryCpLayout.Open;
  (* Insere Descricao da origem ou destino *)
  cbArquivo.Items.Clear;
  (* 0 = TABELA CAPSEGASS *)
  (* 1 = INFORMAÇÕES DIVERSAS *)
  (* 2 = INFORMAÇÕES PARA ENVIO DE COBRANÇA - FOLHA PATROCINADORA *)
  For A:= 0 to NTabelas do cbArquivo.Items.Add(TabDescOrigem[A]);
end;

procedure TfrmLgLayout.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTpLayout.Close;
  qryCpLayout.Close;
  qryLgLayout.Close;
end;

procedure TfrmLgLayout.AbreqryLgLayout;
begin
  With qryLgLayout do
  begin
    Close;
    If sIdLayout<>'' then
     ParamByName('IDLAYOUT').Value:=sIdLayout
    else  ParamByName('IDLAYOUT').AsInteger:=0;
    Open;
  end; {With}
end;

procedure TfrmLgLayout.cbArquivoClick(Sender: TObject);
begin
  inherited;
   (* Pega o nome da tabela *)
  sNomeArq:=TabTabelas[cbArquivo.ItemIndex];
  If TabTipo[cbArquivo.ItemIndex]='I' then
    gbDestino.Caption:='Descrição do Destino das Informações'
  else gbDestino.Caption:='Descrição da Origem das Informações';
  If sNomeArq<>'' then
  begin
    (* Insere nomes de campos no combobox *)
    InsereNomesFan;
    (* Verifica se tabela Existe *)
    With qryTabela do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM ALL_TABLES'+
              ' WHERE TABLE_NAME = '+Chr(39)+sNomeArq+Chr(39));
      Open;
      If Not IsEmpty then
      begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT * FROM '+sNomeArq+
                ' WHERE ROWNUM < 2');
        Open;
      end
      else
        begin
          Close;
          MsgDlg('TABELA NÃO EXISTE!','Erro',mtError,[mbOk,mbHelp],0);
        end;
    end; {With}
  end;
end;

procedure TfrmLgLayout.dblktipoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  sIdLayout:=qryTpLayOut.FieldByName('IDLAYOUT').AsString;
  If sIdlayout<>'' then
  With qryCpLayout do
  begin
    Close;
    ParamByName('IDTPLAYOUT').Value:=sIdLayout;
    Open;
  end; {With}
  sIdCpLayout:=qryCpLayout.FieldByName('IDCPLAYOUT').AsString;
  AbreqryLgLayout;
end;

procedure TfrmLgLayout.dblkCampoLayoutCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Var sFlgValor: String;
begin
  inherited;
  LabelObs.Caption:='';
  InsereNomesFan;
  chkConteudoFixo.Checked:=False;
  editConteudo.Text:='';
  sFlgValor:=qryCpLayout.FieldByName('FlgValor').AsString;
  If sFlgValor='0' then
  begin
    LabelObs.Caption:='CAMPO COMUM              ';
    cbFormato.Items.Clear;
  end
  else
  If sFlgValor='1' then
  begin
    LabelObs.Caption:='CAMPO DATA                ';
    cbFormato.Items.Clear;
  end
  else
  If sFlgValor='2' then
  begin
    LabelObs.Caption:='VALOR INTEIRO             ';
    cbFormato.Items.Clear;
  end
  else
  If sFlgValor='3' then
  begin
    LabelObs.Caption:='VALOR COM 2 CASAS DECIMAIS';
    cbFormato.Items.Clear;
    cbFormato.Items.Add('99999.99');
    cbFormato.Items.Add('99999999');
  end
  else
  If sFlgValor='4' then
  begin
    LabelObs.Caption:='VALOR COM 3 CASAS DECIMAIS';
    cbFormato.Items.Clear;
    cbFormato.Items.Add('99999.999');
    cbFormato.Items.Add('999999999');
  end
  else
  If sFlgValor='5' then
  begin
    LabelObs.Caption:='VALOR COM 4 CASAS DECIMAIS';
    cbFormato.Items.Clear;
    cbFormato.Items.Add('99999.9999');
    cbFormato.Items.Add('9999999999');
  end;
end;

procedure TfrmLgLayout.btnColocarClick(Sender: TObject);
Var sDescAssoc, sConteudo, sFlgValor: String;
begin
  inherited;

  If (cbCampoDisponivel.ItemIndex=-1)And
      (cbCampoDisponivel.Text<>'CONTEÚDO FIXO') then Exit;

  If (qryTpLayout.IsEmpty)Or(qryCpLayout.IsEmpty)Or
      (CbArquivo.Text='') then Exit;

  sFlgValor:=qryCpLayout.FieldByName('FlgValor').AsString;
  If (cbFormato.Text='')And(sFlgValor='3')Or(sFlgValor='4')Or
      (sFlgValor='5') then MsgDlg('Não foi escolhido o formato!',
                                   'Observação',mtInformation,[mbOk],0);

  sIdLayout:=qryCpLayout.FieldByName('IDLAYOUT').AsString;
  sIdCpLayout:=qryCpLayout.FieldByName('IDCPLAYOUT').AsString;

  (* Pega o campo conforme combobox *)
  Case cbArquivo.ItemIndex Of
    0: sCampoArq:=TabCampos0[cbCampoDisponivel.ItemIndex];
    1: begin
         If (Trim(qryCpLayout.FieldByName('NOMECPO').AsString)='HEADER')Or
              (Trim(qryCpLayout.FieldByName('NOMECPO').AsString)='TRAILER') then
           sCampoArq:=TabCampos2[cbCampoDisponivel.ItemIndex]
         else sCampoArq:=TabCampos1[cbCampoDisponivel.ItemIndex];
       end;
   // 2: sCampoArq:=TabCampos3[cbCampoDisponivel.ItemIndex];
  end;
  sTipoArq:='T';
  If (EditConteudo.Enabled)And(cbCampoDisponivel.Text='CONTEÚDO FIXO') then
  begin
    sConteudo:=EditConteudo.Text;
    sCampoArq:='FIXO';
    sTipoArq:='F';
  end
  else
    begin
      If Trim(cbFormato.Text)<>'' then sConteudo:='@'+Trim(cbFormato.Text);
      //If Trim(cbFuncao.Text)<>'' then sConteudo:=sConteudo+'^'+Trim(cbFuncao.Text);
    end;

  sDescAssoc:=dblkCampoLayout.Text+' = '+cbCampoDisponivel.Text;

  With qryIns do
  begin
    Close;
    SqL.Clear;
    SqL.Add('SELECT IDLAYOUT'+
              ' FROM LGLAYOUT'+
              ' WHERE IDCPLAYOUT = '+sIdCpLayOut);
    Open;
    If Not IsEmpty then
    begin
      Close;
      MsgDlg('ERRO! '+
       #13+'CAMPO JÁ ESTÁ ASSOCIADO!',
        'Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end;
  end; {With}

  iIdLgLayout:= LeUltRegistro(nil,'LGLAYOUT');

  If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  sSql:='INSERT INTO LGLAYOUT (IDLGLAYOUT,IDLAYOUT,'+
        ' IDCPLAYOUT,NOMEARQ,CAMPOARQ,TIPOARQ,DESCASSOC,CONTEUDO)'+
        ' VALUES ('+IntToStr(iIdLgLayout)+','+sIdLayout+','+
          sIdCpLayout+','+QuotedStr(sNomeArq)+','+
          QuotedStr(sCampoArq)+','+QuotedStr(sTipoArq)+','+
          QuotedStr(sDescAssoc)+','+QuotedStr(sConteudo)+')';

  If sSql<>'' then
  With qryIns do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSqL);
    try
      ExecSQL;
    except
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
              'Erro',mtError,[mbOk,mbHelp],0);
      Abort;
    end;
    dtmBaseDados.dbBaseDados.Commit;
  end; {With}
  AbreqryLgLayout;
  qryLgLayout.Last;
end;

procedure TfrmLgLayout.btnRetirarClick(Sender: TObject);
Var sSql: String;
begin
  inherited;
  If (qryTpLayout.IsEmpty)Or(qryCpLayout.IsEmpty)Or
      (CbArquivo.Text='') then Exit;

  If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  sIdLayout:=qryLgLayout.FieldByName('IDLAYOUT').AsString;
  sIdCpLayout:=qryLgLayout.FieldByName('IDCPLAYOUT').AsString;
  sIdLgLayout:=qryLgLayout.FieldByName('IDLGLAYOUT').AsString;

  sSql:='DELETE FROM LGLAYOUT'+
        ' WHERE'+
        ' (IDLAYOUT = '+sIdLayout+') AND'+
        ' (IDCPLAYOUT = '+sIdCpLayout+') AND'+
        ' (IDLGLAYOUT = '+sIdLgLayout+')';

  If sSql<>'' then
  With qryIns do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSqL);
    try
      ExecSQL;
    except
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
              'Erro',mtError,[mbOk,mbHelp],0);
      Abort;
    end;
    dtmBaseDados.dbBaseDados.Commit;
  end; {With}
  AbreqryLgLayout;
end;

procedure TfrmLgLayout.chkConteudoFixoClick(Sender: TObject);
begin
  inherited;
  If chkConteudoFixo.Checked then
  begin
    EditConteudo.Enabled:=True;
    cbCampoDisponivel.Items.Clear;
    cbCampoDisponivel.Items.Add('CONTEÚDO FIXO');
    cbCampoDisponivel.ItemIndex:=0;
    cbFormato.Enabled:=False;
    EditConteudo.Text:='';
    EditConteudo.SetFocus;
  end
  else
  begin
    EditConteudo.Text:='';
    EditConteudo.Enabled:=False;
    cbCampoDisponivel.Text:='';
    cbFormato.Enabled:=True;
    InsereNomesFan;
  end;
end;

end.
