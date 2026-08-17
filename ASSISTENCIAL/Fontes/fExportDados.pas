unit fExportDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables,
  Wwquery, OpenArqText, wwdblook, Wwdatsrc, ComCtrls,  TB97, IvDictio,
  IvMulti, IvEMulti, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, CheckLst;

type
  TfrmExportDados = class(TfrmOkCancelar)
    qryCpLayout: TwwQuery;
    dsCpLayout: TwwDataSource;
    dsTpLayout: TwwDataSource;
    qryTpLayout: TwwQuery;
    qryIns: TwwQuery;
    qryLgLayout: TwwQuery;
    dsLgLayout: TwwDataSource;
    qryAssoc: TwwQuery;
    qryTpLayoutIDLAYOUT: TFloatField;
    qryTpLayoutDESCRICAO: TStringField;
    qryTpLayoutTRGDTINCLUSAO: TDateTimeField;
    qryTpLayoutTRGUSERINCLUSAO: TStringField;
    qryLgLayoutIDLGLAYOUT: TFloatField;
    qryLgLayoutIDLAYOUT: TFloatField;
    qryLgLayoutIDCPLAYOUT: TFloatField;
    qryLgLayoutDESCASSOC: TStringField;
    gbPatro: TGroupBox;
    GroupBox2: TGroupBox;
    dblkTipoLayout: TwwDBLookupCombo;
    Panel1: TPanel;
    Label2: TLabel;
    gbFiltros: TGroupBox;
    dblkProduto: TwwDBLookupCombo;
    dblkPlano: TwwDBLookupCombo;
    LabelProduto: TLabel;
    LabelPlano: TLabel;
    dblkMesCob: TwwDBLookupCombo;
    LabelMesCob: TLabel;
    qryPatro: TwwQuery;
    qryMesCob: TwwQuery;
    qryProduto: TwwQuery;
    qryPlano: TwwQuery;
    SaveDialog: TSaveDialog;
    pnlInfArquivo: TPanel;
    qryCpLayoutIDLAYOUT: TFloatField;
    qryCpLayoutIDCPLAYOUT: TFloatField;
    qryCpLayoutDATA: TDateTimeField;
    qryCpLayoutNOMECPO: TStringField;
    qryCpLayoutPOSINICIAL: TFloatField;
    qryCpLayoutPOSFINAL: TFloatField;
    qryCpLayoutIDMODULO: TFloatField;
    qryCpLayoutTIPOREG: TStringField;
    qryCpLayoutFLGVALOR: TStringField;
    chkPatro: TCheckListBox;
    btnArquivo: TBitBtn;
    Memo: TMemo;
    SaveDialogMens: TSaveDialog;
    btnSalvar: TBitBtn;
    pnlProgresso: TPanel;
    lblPainel: TLabel;
    lContador: TLabel;
    Animacao: TAnimate;
    LabelInf: TLabel;
    Marca: TBitBtn;
    procedure bbtnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblkTipoLayoutCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkProdutoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnArquivoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure MarcaClick(Sender: TObject);
  private
    { Private declarations }
    TotalInc,
    TotalIncPatro: Integer;
    sTotalRegistros: String;
    dValorEsperado,
    dTotalValor : Double;
    Function ConteudoFormatado(sContAssoc:String;sConteudo:String;TCp:Byte):String;
    Procedure GravaHeader(pTipo:String);
    Procedure GravaDetalhe;

  public

    { Public declarations }
  end;

var
  frmExportDados: TfrmExportDados;
  qryExport: TwwQuery;
  qryAcumulo: TwwQuery;
  FArq: TextFile;
  sVlIns,
  sFlgValor,
  sLinha: String;

implementation

uses DBaseDados, UDataBase, UMensErro, UAdmass, ULayoutAss;

{$R *.DFM}

Procedure TfrmExportDados.GravaHeader(pTipo:String);
Var A,IPosIn,
    IposFi,
    Tam: Integer;
    sCampo,
    sIdent,
    sTipoArq,
    sConteudo,
    sNomeCpo,
    sConteudoAssoc: String;
    bIdent: Boolean;
begin
  bIdent:=True;
  qryAssoc.First;
  Repeat
    sNomeCpo:=Trim(qryAssoc.FieldByName('NOMECPO').AsString);
    sIdent:=Trim(qryAssoc.FieldByName('TipoReg').AsString);
    If (sNomeCpo<>pTipo)And(sIdent='') then bIdent:=False;
    qryAssoc.Next;
  Until(qryAssoc.Eof)Or(bIdent);
  qryAssoc.First;
  Repeat
    sVlIns:='';
    sIdent:=Trim(qryAssoc.FieldByName('TipoReg').AsString);
    Repeat
      sNomeCpo:=Trim(qryAssoc.FieldByName('NOMECPO').AsString);
      If (sNomeCpo=pTipo) then
      begin
        iPosIn:=qryAssoc.FieldByName('PosInicial').AsInteger;
        iPosFi:=qryAssoc.FieldByName('PosFinal').AsInteger;
        sFlgValor:=qryAssoc.FieldByName('FlgValor').AsString;
        sCampo:=qryAssoc.FieldByName('CampoArq').AsString;
        sConteudo:=qryAssoc.FieldByName('Conteudo').AsString;
        sTipoArq:=qryAssoc.FieldByName('TipoArq').AsString;

        Tam:=0;
        For A:=iPosIn to iPosfi do Inc(Tam,1);

        (* Insere Identificador do Registro *)
        If (sVlIns='')And(Not bIdent) then sVlIns:=sVlIns+sIdent;

        If (sTipoArq<>'F') then
        begin
          (* Conteudo do campo da qryAcumulo *)
          sConteudoAssoc:=qryAcumulo.FieldByName(sCampo).AsString;
          (* Formata o conteúdo caso houver formato *)
          sVlIns:=sVlIns+Esq(ConteudoFormatado(sConteudoAssoc,sConteudo,Tam),Tam);
        end else sVlIns:=sVlIns+Esq(sConteudo,Tam);
      end;
      qryAssoc.Next;
    Until(qryAssoc.Eof)Or(sIdent<>qryAssoc.FieldByName('TipoReg').AsString);
    (* Grava no arquivo de exportação *)
    If (qryAssoc.Eof)Or(sIdent<>qryAssoc.FieldByName('TipoReg').AsString) then
     If Trim(sVlIns)<>'' then
     begin
       Writeln(FArq,sVlIns);
       sVlIns:='';
     end;
    If Not qryAssoc.Eof then qryAssoc.Next;
  Until(qryAssoc.Eof);
end;

Procedure TfrmExportDados.GravaDetalhe;
Var A,IPosIn,
    IposFi,
    Tam: Integer;
    sCampo,
    sIdent,
    sTipoArq,
    sConteudo,
    sNomeCpo,
    sConteudoAssoc: String;
begin
  sVlIns:='';
  qryAssoc.First;
  Repeat
    sNomeCpo:= qryAssoc.FieldByName('NOMECPO').AsString;
    If (sNomeCpo<>'HEADER')And(sNomeCpo<>'TRAILER') then
    begin
      iPosIn:=qryAssoc.FieldByName('PosInicial').AsInteger;
      iPosFi:=qryAssoc.FieldByName('PosFinal').AsInteger;
      sFlgValor:=qryAssoc.FieldByName('FlgValor').AsString;
      sCampo:=qryAssoc.FieldByName('CampoArq').AsString;
      sIdent:=qryAssoc.FieldByName('TipoReg').AsString;
      sConteudo:=qryAssoc.FieldByName('Conteudo').AsString;
      sTipoArq:=qryAssoc.FieldByName('TipoArq').AsString;

      Tam:=0;
      For A:=iPosIn to iPosfi do Inc(Tam,1);

      (* #@ - Caso o arquivo movimento não tenha Header ou Trailer *)
      If Trim(sIdent)='#@'then sIdent:='';

      (* Insere Identificador do Registro *)
      If sVlIns='' then sVlIns:=sIdent;

      If (sTipoArq<>'F') then
      begin
        (* Conteudo do campo da qryExport *)
        sConteudoAssoc:=qryExport.FieldByName(sCampo).AsString;
        (* Formata o conteúdo caso houver *)
        sVlIns:=sVlIns+Esq(ConteudoFormatado(sConteudoAssoc,sConteudo,Tam),Tam);
        If sCampo='PREMIO_AP' then
        begin
          dValorEsperado:=dValorEsperado + qryExport.FieldByName('VALORESPERADO').AsFloat;
          dTotalValor:=dTotalValor + qryExport.FieldByName('VALORESPERADO').AsFloat;
        end;
      end else sVlIns:=sVlIns+Esq(sConteudo,Tam);
    end;
    qryAssoc.Next;
  Until(qryAssoc.Eof);
  (* Grava no arquivo de exportação *)
  If Trim(sVlIns)<>'' then
  begin
    Writeln(FArq,sVlIns);
    Inc(TotalInc);
    Inc(TotalIncPatro);
    lContador.Caption := IntToStr(TotalIncPatro) + sTotalRegistros;
    pnlProgresso.Update;
    Application.ProcessMessages;
  end;
end;

Function TfrmExportDados.ConteudoFormatado(sContAssoc:String;sConteudo:String;TCp:Byte):String;
Var sCont, sFormato, sFuncao: String;
    A,Tam: Integer;
    cCh: Char;
    fAux: Double;
begin
  Tam:=Length(sConteudo);
  sFormato:='';
  sFuncao:='';
  sCont:='';
  cCh:=#0;
  For A:=1 to Tam do
  begin
    If (sConteudo[A]='@')Or(sConteudo[A]='^') then
    begin
      cCh:=sConteudo[A];
      Continue;
    end;
    If cCh='@' then sFormato:=sFormato+sConteudo[A]
    else If cCh='^' then sFuncao:=sFuncao+sConteudo[A];
  end; {For}

  If StrToIntDef(Trim(sFlgValor), 0) In [2..5] then
  begin
    try
      fAux := StrToFloat(sContAssoc);
    except
      fAux := 0
    end;

    sContAssoc:=FormatFloat('0.00',fAux);
    sContAssoc:=LimpaString(sContAssoc);
    Zeros(sContAssoc,TCp);
    Zeros(sFormato,TCp);
    For A:= 1 to Tcp do
    begin
      cCh:=sFormato[A];
      If cCh In ['/','-','.'] then Insert(cCh,sContAssoc,A+1);
    end;
    Zeros(sContAssoc,TCp);
    sContAssoc:=Dir(sContAssoc,TCp);
  end;
  Result:=sContAssoc;
end;

procedure TfrmExportDados.bbtnCancelaClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmExportDados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryTpLayout.Close;
  qryCpLayout.Close;
  qryLgLayout.Close;
  qryIns.Close;
  action := cafree;
end;

procedure TfrmExportDados.FormCreate(Sender: TObject);
begin
  inherited;
  PnlInfArquivo.Caption:='';
  gbFiltros.Enabled:=False;
  bbtnConfirmar.Enabled:=False;
  qryTpLayout.open;
  qryCpLayout.open;
  qryLgLayout.Open;
  qryPatro.Open;
  qryMesCob.Open;
  qryProduto.Open;
  qryPlano.Close;
  qryPlano.ParamByName('PIDPRODASS').AsInteger:=qryProduto.FieldByName('IDPRODASS').AsInteger;
  qryPlano.Open;
  chkPatro.Items.Clear;
  While Not qryPatro.Eof do
  begin
    chkPatro.Items.Add(qryPatro.FieldByName('NOME').AsString);
    qryPatro.Next;
  end;
end;

procedure TfrmExportDados.bbtnConfirmarClick(Sender: TObject);
var qryTmp: TwwQuery;
    sIdLayout,
    sIdCpLayout,
    sIdLgLayout,
    sNomeTab,
    sIdPessJur: String;
    Ind: Integer;

begin
  inherited;
  TotalInc:=0;
  TotalIncPatro:=0;
  dTotalValor:=0;
  BtnSalvar.Enabled:=False;
  For Ind := 0 to chkPatro.Items.Count - 1 do
   If chkPatro.Checked[Ind] then Inc(TotalIncPatro);
  If TotalIncPatro=0 then
  begin
    MsgDlg('Nenhuma Patrocinadora foi Selecionada',
            'Atenção',mtWarning,[mbOk,mbHelp],0);
    Exit;
  end;
  If dblkMesCob.Text='' then
  begin
    If MsgDlg('O Mês de Cobrança não foi escolhido.'+#13+
        'Nesse caso não haverá informações do Histórico de Contribuições.'+#13+
        'Deseja continuar com a exportação?','Atenção',
         mtWarning, [mbyes,mbno], 0) = mrNo then Exit;
  end;
  Memo.Lines.Clear;
  Memo.Lines.Add('============================================================');
  Memo.Lines.Add('EXPORTAÇÃO PARA ARQUIVO          - Data: '+DateToStr(Now));
  Memo.Lines.Add('============================================================');
  Memo.Lines.Add('Descrição do Lay-Out: '+dblkTipoLayout.Text);
  Memo.Lines.Add(Esq('Patrocinadora',35)+'  Quantidade  Valor');
  Memo.Lines.Add('------------------------------------------------------------');
  If (qryTpLayout.IsEmpty)Or(qryCpLayout.IsEmpty)Or
      (qryLgLayout.IsEmpty) then
  begin
    MsgDlg('ERRO! '+#13+'ESCOLHA O TIPO DE LAY-OUT.',
              'Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  gbFiltros.Enabled:=False;
  sIdLayout:=qryLgLayout.FieldByName('IdLayout').AsString;
  sIdCpLayout:=qryLgLayout.FieldByName('IdCpLayout').AsString;
  sIdLgLayout:=qryLgLayout.FieldByName('IdLgLayout').AsString;
  With qryAssoc do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT'+
            ' LG.IDLGLAYOUT,'+
            ' LG.IDLAYOUT,'+
            ' LG.IDCPLAYOUT,'+
            ' LG.NOMEARQ,'+
            ' LG.CAMPOARQ,'+
            ' LG.TIPOARQ,'+
            ' LG.CONTEUDO,'+
            ' CP.NOMECPO,'+
            ' CP.TIPOREG,'+
            ' CP.POSINICIAL,'+
            ' CP.POSFINAL,'+
            ' CP.FLGVALOR'+

            ' FROM CPLAYOUT CP, LGLAYOUT LG'+

            ' WHERE'+
            ' (LG.IDLAYOUT = '+sIdLayout+') AND'+
            ' (LG.IDCPLAYOUT = CP.IDCPLAYOUT)'+

            ' ORDER BY CP.TIPOREG,CP.POSINICIAL');
    Open;
    If IsEmpty then
    begin
      Close;
      MsgDlg('ERRO! '+#13+'NÃO FORAM ASSOCIADOS OS CAMPOS DO LAYOUT.',
              'Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end;
  end; {With}

  QryExport:=TwwQuery.Create(Nil);
  QryExport.DataBaseName:='BaseDados';
  QryAcumulo:=TwwQuery.Create(Nil);
  QryAcumulo.DataBaseName:='BaseDados';

  If SaveDialog.FileName<>'' then
  begin
    AssignFile(FArq,SaveDialog.FileName);
    {$I+}
    ReWrite(FArq);
    {$I-}
    If IoResult=0 then
    begin
      QryTmp:=TwwQuery.Create(Nil);
      QryTmp.DataBaseName:='BaseDados';
      qryTmp.Close;
      qryTmp.Sql.Clear;
      qryTmp.Sql.Add(
        ' SELECT DISTINCT NOMEARQ FROM LGLAYOUT '+
        ' WHERE CAMPOARQ<>''FIXO'' AND IDLAYOUT = '+sIdLayout);
      qryTmp.Open;
      If qryTmp.RecordCount=1 then
        sNomeTab:=Trim(qryTmp.FieldByName('NOMEARQ').AsString)
      else sNomeTab:='';
      qryTmp.Close;
      qryTmp.Free;
      If sNomeTab='' then
      begin
        MsgDlg('Erro na associação do lay-out.',
              'Erro',mtError,[mbOk,mbHelp],0);
        CloseFile(FArq);
        qryExport.Free;
        qryAcumulo.Free;
        Exit;
      end;

      For Ind := 0 to chkPatro.Items.Count - 1 do
      begin
        TotalIncPatro:=0;
        dValorEsperado:=0;
        If (Not chkPatro.Checked[Ind]) then Continue;
        If qryPatro.Locate('NOME', chkPatro.Items[Ind], [loPartialKey]) then
          sIdPessJur:=qryPatro.FieldByName('IDPESSJUR').AsString
        else
        begin
          MsgDlg('Houve ao buscar Patrocinadora '+chkPatro.Items[Ind],
              'Erro',mtError,[mbOk,mbHelp],0);
          qryExport.Free;
          qryAcumulo.Free;
          Abort;
        end;

        pnlProgresso.Visible:= True;
        Animacao.Active:= True;
        lblPainel.Caption := chkPatro.Items[Ind];
        lContador.Caption := '';
        LabelInf.Caption:='Buscando Informações ...';
        Application.ProcessMessages;

        If sNomeTab='PARTASS' then
        begin
          BuscaInformacoes(QryExport,sIdPessJur,dblkMesCob.LookupValue,
                          dblkProduto.LookupValue,dblkPlano.LookupValue);
          (* Acumulo *)
          BuscaAcumuloInformacoes(QryAcumulo,sIdPessJur,dblkMesCob.LookupValue,
                        dblkProduto.LookupValue,dblkPlano.LookupValue);
        end
        else
        If sNomeTab='TMPDESC' then
        begin
         // dblkProduto.Text:='';
         // dblkPlano.Text:='';
         // dblkProduto.Enabled:=False;
         // dblkPlano.Enabled:=False;
         // BuscaInfEnvioPatro(QryExport,dblkPatro.LookupValue,dblkMesCob.LookupValue);
         // qryAcumulo:=qryExport;
        end;
        If (qryExport.IsEmpty)Or(qryAcumulo.IsEmpty) then
        begin
          Animacao.Active:=False;
          pnlProgresso.Visible:=False;
          Memo.Lines.Add('Não foram encontradas informações '+
            'para Patrocinadora '+chkPatro.Items[Ind]);
          Continue;
        end;

        sTotalRegistros:= ' / ' + IntToStr(qryExport.RecordCount);
        LabelInf.Caption:='Exportanco Informações para Arquivo';
        Application.ProcessMessages;


        qryAcumulo.First;
        GravaHeader('HEADER');

        qryExport.First;
        While Not qryExport.Eof do
        begin
          GravaDetalhe;
          qryExport.Next;
        end;
        qryExport.First;

        qryAcumulo.First;
        GravaHeader('TRAILER');

        Memo.Lines.Add(Esq(chkPatro.Items[Ind],35)+'  '+IntToStr(TotalIncPatro)+
                        '  =  '+FormatFloat('###,###,##0.00',dValorEsperado));

      end; {For}
      CloseFile(FArq);
      Animacao.Active:=False;
      pnlProgresso.Visible:=False;
      chkPatro.SendToBack;
      Memo.BringToFront;
      BtnSalvar.Enabled:=True;
      gbPatro.Caption:='Mensagens';
      MsgDlg('Exportação Concluida!'+#13+
             'Registros Exportados: '+IntToStr(TotalInc)+'  =  '+
              FormatFloat('###,###,##0.00',dTotalValor)+'.'+#13+
             'Arquivo foi gravado em '+SaveDialog.FileName,'Resultado',mtInformation,[mbOk],0);
    end else MsgDlg('Erro ao criar arquivo de exportação!','Erro',mtError,[mbOk],0);
  end else MsgDlg('É necessário digitar o nome do arquivo de destino.','Erro',mtError,[mbOk,mbHelp],0);
  qryExport.Free;
  qryAcumulo.Free;
  Animacao.Active:=False;
  pnlProgresso.Visible:=False;
  bbtnConfirmar.Enabled:=False;
end;

procedure TfrmExportDados.bbtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmExportDados.dblkTipoLayoutCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dblkProduto.Enabled:=True;
  dblkPlano.Enabled:=True;
  qryCpLayout.Close;
  qryLgLayout.Close;
  qryCpLayout.ParamByName('PIDLAYOUT').Value:=qryTpLayout.FieldByName('IDLAYOUT').Value;
  qryCpLayout.Open;
  qryLgLayout.ParamByName('PPIDLAYOUT').Value:=qryCpLayout.FieldByName('IDLAYOUT').Value;
  qryLgLayout.Open;
end;

procedure TfrmExportDados.dblkProdutoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlano.Close;
  qryPlano.ParamByName('PIDPRODASS').AsInteger:=qryProduto.FieldByName('IDPRODASS').AsInteger;
  qryPlano.Open;
end;

procedure TfrmExportDados.btnArquivoClick(Sender: TObject);
begin
  inherited;
  btnSalvar.Enabled:=False;
  Memo.SendToBack;
  gbPatro.Caption:='Patrocinadoras';
  chkPatro.BringToFront;
  SaveDialog.Execute;
  gbFiltros.Enabled:=SaveDialog.FileName<>'';
  PnlInfArquivo.Caption:='  Arquivo Destino: '+SaveDialog.FileName;
  bbtnConfirmar.Enabled:=(qryTpLayout.Active)And(qryCpLayout.Active)And
                          (qryLgLayout.Active)And(SaveDialog.FileName<>'');
end;

procedure TfrmExportDados.btnSalvarClick(Sender: TObject);
begin
  inherited;
  SaveDialogMens.Execute;
  If SaveDialogMens.FileName<>'' then
    Memo.Lines.SaveToFile(SaveDialogMens.FileName);
  btnSalvar.Enabled:=False;
  Memo.SendToBack;
  gbPatro.Caption:='Patrocinadoras';
  chkPatro.BringToFront;
end;

procedure TfrmExportDados.MarcaClick(Sender: TObject);
var i : integer;
begin
  inherited;
  for i := 0 to chkPatro.Items.Count - 1 do
    chkPatro.Checked[i] := not chkPatro.Checked[i];
end;


end.

