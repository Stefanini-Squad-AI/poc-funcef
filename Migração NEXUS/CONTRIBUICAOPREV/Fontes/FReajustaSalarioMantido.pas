// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)   :  Taffarel Sevaybriker
// Data       :  20/03/2018
// Pendência  :  SIG 41789
// Descricao  :  Alteração na tela de ajuste de salário. Incluído campo de
//               alteração manual de salário. Retirado campo de mês de reajuste.
//------------------------------------------------------------------------------
// Autor(a)   :  Jéssica Lana Nunes dos Santos
// Data       :  05/03/2009
// Pendência  :  SOL 109421 KINTANA 496332
// Descricao  :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------
unit FReajustaSalarioMantido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, Spin, ComCtrls, checklst, URegra, TB97Tlbr, Mask,
  IvDictio, IvMulti, IvEMulti, Menus;

type
  TfrmReajustaSalarioMantido = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    pnlOpcoes: TPanel;
    pnldetalhe: TPanel;
    lblDetalhe: TLabel;
    lblValores: TLabel;
    qryDetalhe: TwwQuery;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    pnlLista: TPanel;
    Label2: TLabel;
    chklstPatro: TCheckListBox;
    Label7: TLabel;
    chklstPlano: TCheckListBox;
    rgSituacao: TRadioGroup;
    bbtnDetalhe: TBitBtn;
    bbtnProcessarReajuste: TBitBtn;
    bbtnVoltarDetalhe: TBitBtn;
    bbtnVerResultado: TBitBtn;
    pnlResult: TPanel;
    memResult: TMemo;
    bbtnVoltarResult: TBitBtn;
    bbtnSalvar: TBitBtn;
    chkResult: TCheckBox;
    SaveDlg: TSaveDialog;
    regCalculo: TRegra;
    qryRegra: TwwQuery;
    pnlProgresso: TPanel;
    pBar: TProgressBar;
    edMesReaj: TMaskEdit;
    Label1: TLabel;
    lblContador: TLabel;
    lblReserva: TLabel;
    pmnu: TPopupMenu;
    DesmarcarTodos1: TMenuItem;
    MarcarTodos1: TMenuItem;
    dbgrdDetalhe: TwwDBGrid;
    dsDetalhe: TwwDataSource;
    updDetalhe: TUpdateSQL;
    bbtnAlterar: TBitBtn;
    gbxPosicionar: TGroupBox;
    Label3: TLabel;
    edtPosicionar: TEdit;
    bbtnPosicionar: TBitBtn;
    bbtnSelecionarTodos: TBitBtn;
    bbtnInverterSelecao: TBitBtn;

    procedure TiraIconeSql;
    procedure bbtnVoltarDetalheClick(Sender: TObject);
    procedure bbtnDetalheClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure bbtnProcessarReajusteClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnVoltarResultClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DesmarcarTodos1Click(Sender: TObject);
    procedure MarcarTodos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelecionarTodosClick(Sender: TObject);
    procedure bbtnInverterSelecaoClick(Sender: TObject);
    procedure bbtnPosicionarClick(Sender: TObject);
    procedure bbtnAlterarClick(Sender: TObject);
    procedure dbgrdDetalheEnter(Sender: TObject);
    

  private { Private declarations }

    strPatro, strPlano : string;
    bErro, bParticipChecado: boolean;

    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    function  Executaregra : boolean;
    function  AlteraParticipante(Coluna : string; dValor: double) : boolean;//Taffarel - SIG41789

  public  { Public declarations }
    procedure SelecionaItemGrid(bSelecionado: boolean) ;
  end;



var
  frmReajustaSalarioMantido: TfrmReajustaSalarioMantido;



implementation
{$R *.DFM}
uses
  UMensErro, DBaseDados, UAdmPrev, UParticipante, Usistema,
  UContribuicaoPrev, FAlteraSalario;



procedure TfrmReajustaSalarioMantido.FormActivate(Sender: TObject);
begin
  inherited;

 {Preencher chkList da Patrocinadora}
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;
  CriaLista(chkLstPatro, qryPatro);

 {Preenche ChkList dos Planos}
  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPlano.Open;
  CriaLista(chklstPlano, qryPlano);

  pnlOpcoes.Visible  := True;
  pnlDetalhe.Visible := False;
  pnlResult.Visible  := False;

  pnlProgresso.Visible := False;
  chkResult.Checked := True;
end;

procedure TfrmReajustaSalarioMantido.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
begin
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;
  end;
end;

procedure TfrmReajustaSalarioMantido.chklstPatroClickCheck(Sender: TObject);
var
   i : integer;
begin
 {Preenche ChkList dos Planos da Patrocinadora Selecionada}
  qryPlano.Close;
  qryPlano.SQL.Clear;
  strPatro := ' ';

  for i := 0 to chklstPatro.Items.Count - 1 do
     if chklstPatro.checked[i] then
       begin
           if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey]) then
              strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
       end;

  if Trim(strPatro) <> '' then
     begin
          strPatro := Copy(strPatro, 1, Length(strPatro) - 2);
          qryPlano.SQL.Add(' SELECT DISTINCT PP.IDPLANOPREV, PP.NOME '+
                           ' FROM PLANPREV PP, PLANPREVPATRO PPP '+
                           ' WHERE PP.IDPLANOPREV = PPP.IDPLANOPREV AND ' +
                           '       PPP.IDPESSJUR  IN ( '+strPatro+') '+
                           ' ORDER BY PP.NOME')
     end
  else
     qryPlano.SQL.Add(' SELECT * FROM PLANPREV ' +
                      ' ORDER BY NOME ');

  qryPlano.Open;
  CriaLista(chklstPlano,qryPlano);
end;

procedure TfrmReajustaSalarioMantido.bbtnDetalheClick(Sender: TObject);
var
  sSQL: string;
  iLista: TListItem;
  i: integer;
begin
  inherited;
    //Taffarel - SIG41789 - inicio
    //  if edMesReaj.Text = ''
    //  then begin
    //     MsgDlg('Informe o ano e mês do reajuste!','Informação',mtInformation,[mbOk,mbHelp],0);
    //     edMesReaj.SetFocus;
    //     Exit;
    //  end;
   //Taffarel - SIG41789 - fim

  bbtnDetalhe.Cursor := crHourGlass;

  if rgSituacao.ItemIndex = 0 then
     lblDetalhe.Caption := 'Detalhamento de Mantidos'
  else
     lblDetalhe.Caption := 'Detalhamento de Mantidos Parciais';

  pnlDetalhe.Visible := True;
  pnlOpcoes.Visible  := False;
  pnlResult.Visible  := False;

  strPatro := '';
  for i := 0 to chklstPatro.Items.Count - 1 do
      if chklstPatro.checked[i] then
         begin
             if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey]) then
                strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
         end;

  if Trim(strPatro) <> '' then
     strPatro := Copy(strPatro, 1, Length(strPatro) - 2);


  strPlano := '';
  for i := 0 to chklstPlano.Items.Count - 1 do
      if chklstPlano.checked[i] then
         begin
             if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive, loPartialKey]) then
                strPlano := strPlano + qryPlano.FieldByName('IdPlanoPrev').AsString+ ', ';
         end;

  if Trim(strPlano) <> '' then
     strPlano := Copy(strPlano, 1, Length(strPlano) - 2);


  sSQL :=  ' SELECT DISTINCT 0 AS PROCESSA, P.NOME AS PARTICIPANTE, PATRO.NOME AS PATROCINADORA, ' +
           '        PL.NOME AS PLANO, E.MATRICULA,  P.IDPESSOA, ' +
           '        PP.SALMANTIDO, S.FLGINTERNO, '+
           '        E.IDPESSJUR, PL.IDPLANOPREV, S.DESCRICAO AS SITUACAOFUNDACAO ' +
           ' FROM   PLANPREV PL, PARTPREVPLAN PP, SITPART S, PESSOA P, ELEGPATRO E, PESSOA PATRO  ' +
           ' WHERE  P.IDPESSOA       = E.IDPESSOA AND ' +
           '        E.IDPESSOA       = PP.IDPESSOA AND ' +
           '        E.IDPESSJUR      = PP.IDPESSJUR AND ' +
           '        PP.IDPLANOPREV   = PL.IDPLANOPREV AND ' +
           '        PATRO.IDPESSOA   = E.IDPESSJUR AND ' +
           '        PP.IDSITPART     = S.IDSITPART ';

  if rgSituacao.ItemIndex = 0 then
     sSQL := sSQL + ' AND S.FLGINTERNO = ' + '''MA'''
  else
     sSQL := sSQL + ' AND S.FLGINTERNO = ' + '''MP''';

  if Trim(strPatro) <> '' then
     sSQL := sSQL + ' AND PP.IDPESSJUR IN (' + strPatro + ') ';

  if Trim(strPlano) <> '' then
     sSQL := sSQL + ' AND PP.IDPLANOPREV IN (' + strPlano + ') ';

  sSQL := sSQL + ' ORDER BY P.NOME ';
  qryDetalhe.Close;
  qryDetalhe.SQL.Clear;
  qryDetalhe.SQL.Add(sSQL);

  try
     qryDetalhe.open;
  except
     on E:EDBEngineError do
     begin
       MostrarErro(E);
       Exit;
     end;
  end;

  if qryDetalhe.IsEmpty then
  begin
     MsgDlg('Não existem Participantes Mantidos com as opções indicadas.','Informação',mtInformation,[mbOk,mbHelp],0);
     pnlOpcoes.Visible   := True;
     pnlDetalhe. Visible := False;
     pnlResult.Visible   := False;

     TiraIconeSql;
     Exit;
  end;

  bbtnDetalhe.Cursor := crDefault;
end;



procedure TfrmReajustaSalarioMantido.bbtnProcessarReajusteClick(Sender: TObject);
var
  iContador: integer;
begin
  inherited;
  bErro := False;

  // Se a Tabela de Participantes Selecionados não estiver ativa, ou estiver vazia
  if (qryDetalhe.State in [dsInactive]) or (qryDetalhe.IsEmpty)
  then begin
     MsgDlg('Nenhum Participante foi selecionado.','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;

  if chkResult.Checked
  then begin
     memResult.Font.Color := clWindowText;
     memResult.Lines.Clear;
     memResult.Lines.Add('Reajuste de Salários de Mantidos - Data : ' + DateToStr(date)+'    LISTA DE EXCEÇÕES ');
     memResult.Lines.Add('--------------------------------------------------');

     pnlProgresso.Visible := True;
     lblReserva.Caption := 'Calculando Reajustes ... ';
     pnlProgresso.Update;

     pBar.Step := 1;
     pBar.Max  := qryDetalhe.RecordCount;
     pBar.Position := 0;
  end;

  dtmBaseDados.dbBaseDados.StartTransaction;
  qryDetalhe.First;
  iContador := 0;
  lblContador.Visible := True;
  lblContador.Caption := 'Processando '+IntToStr(iContador)+ ' de '+IntToStr(pBar.Max);
  bParticipChecado := False;
  while not qryDetalhe.Eof do
  begin
     if qryDetalhe.FieldByName('PROCESSA').AsInteger <= 0
     then begin
        qryDetalhe.Next;
        continue;
     end;
     bParticipChecado  := True;
     if not ExecutaRegra
     then begin
        if MsgDlg('Ocorreu um erro ao reajustar o salário do participante. Deseja continuar para os próximos participantes ? ',
                  'Confirmação', mtConfirmation,[mbYes, mbNo],0) = mrNo
        then begin
           pnlProgresso.Visible := False;
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        end;
     end;
     qryDetalhe.Next;
     inc(iContador);
     pBar.Position := pBar.Position + 1;
     lblContador.Caption := 'Processando '+IntToStr(iContador)+ ' de '+IntToStr(pBar.Max);
     Application.ProcessMessages;
  end;

  // Se nao selecionou nenhum participante
  if not bParticipChecado
  then begin
     pnlProgresso.Visible := False;
     MsgDlg('Nenhum Participante foi selecionado.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtmBaseDados.dbBaseDados.RollBack;
     Exit;
  end;

  bbtnDetalheClick(Sender);

  pnlProgresso.Visible := False;
  if not bErro
  then  MsgDlg('Reajuste efetuado com sucesso. Verifique o resultado e clique no botão "Confirmar" para '+
               ' aplicar as alterações.','Informação',mtInformation,[mbOk,mbHelp],0)
  else begin
     MsgDlg('Reajuste efetuado com erros.','Informação',mtInformation,[mbOk,mbHelp],0);
     dtmBaseDados.dbBaseDados.RollBack;
     if (chkResult.checked) then
     begin
         pnldetalhe.Visible   := False;
         pnlResult.Visible    := True;
     end;
  end;

  TiraIconeSql;
end;



function TfrmReajustaSalarioMantido.ExecutaRegra : boolean;
var
   sValorReserva,
   sSalPart,
   sDataInscFund,
   sMesReferencia,
   sIdRegraReajuste,
   sPercentualReajuste,
   sSql, sValorRegra: string;
   sSalarioAntesReajuste,
   sSalarioIntegral : string;
begin
   Result := False;

  sSalarioIntegral      := qryDetalhe.FieldByName('SALMANTIDO').AsString;
  sSalarioAntesReajuste := sSalarioIntegral;
  if not ReajustaSalPatro( qryAux,
                           edMesReaj.Text,
                           qryDetalhe.FieldByName('IDPESSJUR').AsString,
                           qryDetalhe.FieldByName('IDPLANOPREV').AsString,
                           qryDetalhe.FieldByName('IDPESSOA').AsString,
                           '01/'+Copy(edMesReaj.Text,6,2)+'/'+Copy(edMesReaj.Text,1,4),
                           '01/'+Copy(edMesReaj.Text,6,2)+'/'+Copy(edMesReaj.Text,1,4),
                           sSalarioIntegral,
                           qryDetalhe.FieldByName('FLGINTERNO').AsString
                           False, False, True)//Taffarel - SIG41789
  then Exit;

  // Grava Salário Reajustado    
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET SALMANTIDO    =   ' + OraNumero(sSalarioIntegral)     +', '+
                 '                         ULTSALMANUT   =   ' + OraNumero(sSalarioAntesReajuste)+', '+
                 '                         MESULTREAJSAL = ''' + edMesReaj.Text +''''+
                 ' WHERE IDPESSJUR   = ' + qryDetalhe.FieldByName('IDPESSJUR').AsString   +
                 ' AND   IDPLANOPREV = ' + qryDetalhe.FieldByName('IDPLANOPREV').AsString +
                 ' AND   IDPESSOA    = ' + qryDetalhe.FieldByName('IDPESSOA').AsString+
                 ' AND   SEQPROPOSTA = 1 ');
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
        begin
             MostrarErro(E);
             Exit;
        end;
  end;
  Result := True;
end;

procedure TfrmReajustaSalarioMantido.bbtnVoltarDetalheClick(Sender: TObject);
begin
  inherited;
  pnlOpcoes.Visible  := True;
  pnlDetalhe.Visible := False;
  pnlResult.Visible  := False;
end;



procedure TfrmReajustaSalarioMantido.TiraIconeSql;
begin
  with qryAux do begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT * FROM DUAL');
     Open;
     Close;
  end;
end;



procedure TfrmReajustaSalarioMantido.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
  pnlResult.Visible  := True;
  pnlOpcoes.Visible  := False;
  pnlDetalhe.Visible := False;
end;



procedure TfrmReajustaSalarioMantido.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
     memResult.Lines.SaveToFile(savedlg.filename);
end;



procedure TfrmReajustaSalarioMantido.bbtnVoltarResultClick(Sender: TObject);
begin
  inherited;
  pnlOpcoes.Visible  := True;
  pnlDetalhe.Visible := False;
  pnlResult.Visible  := False;
end;



procedure TfrmReajustaSalarioMantido.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Try
    If Not Sistema.GravaLogOperacoes('Reajusta Salário de Manutenção') Then
      raise exception.Create('Erro ao gravar Log.');
    //Taffarel - SIG41789 - início
    if dtmBaseDados.dbBaseDados.InTransaction
    then dtmBaseDados.dbBaseDados.Commit;

    SelecionaItemGrid(false);
  Except
    SelecionaItemGrid(true);
  End;

       bbtnProcessarReajuste.Enabled := True;
       qryDetalhe.first;
     //Taffarel - SIG41789 - fim
end;



procedure TfrmReajustaSalarioMantido.bbtnSairClick(Sender: TObject);
begin
  //Taffarel - SIG41789 - inicio
  if dtmBaseDados.dbBaseDados.InTransaction then
    begin
     if Application.messageBox('Existem alterações que não foram efetivadas.'+#13#10+'Deseja sair da interface?','Confirmação',mb_YesNo+mb_IconInformation+mb_DefButton2)=mrYes then
      begin
        dtmBaseDados.dbBaseDados.RollBack;
        inherited;
      end;
    end
  else inherited;
  //Taffarel - SIG41789 - fim
end;



procedure TfrmReajustaSalarioMantido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryDetalhe.UpdatesPending then qryDetalhe.CancelUpdates;
  inherited;
end;



procedure TfrmReajustaSalarioMantido.DesmarcarTodos1Click(Sender: TObject);
begin
  inherited;
  qryDetalhe.First;
  while not qryDetalhe.Eof do
  begin
     qryDetalhe.Edit;
     qryDetalhe.FieldByName('PROCESSA').AsInteger := 0;
     qryDetalhe.Post;
     qryDetalhe.Next;
  end;
  qryDetalhe.First;
end;



procedure TfrmReajustaSalarioMantido.MarcarTodos1Click(Sender: TObject);
begin
  inherited;
  qryDetalhe.First;
  while not qryDetalhe.Eof do
  begin
     qryDetalhe.Edit;
     qryDetalhe.FieldByName('PROCESSA').AsInteger := 1;
     qryDetalhe.Post;
     qryDetalhe.Next;
  end;
  qryDetalhe.First;

end;



procedure TfrmReajustaSalarioMantido.FormCreate(Sender: TObject);
begin
  inherited;
  //Taffarel - SIG41789 - início
  edMesReaj.text := FormatDateTime('yyyy/mm', date);
  edMesReaj.Visible := False;
  Label1.Visible := edMesReaj.Visible;
  SelecionaItemGrid(false);
  //Taffarel - SIG41789 - fim

  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  SaveDlg.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\';

  end;

//Taffarel - SIG41789 - início
procedure TfrmReajustaSalarioMantido.bbtnSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  if not(qryDetalhe.isEmpty) then
    begin
      qryDetalhe.first;
      while not(qryDetalhe.eof)do
       begin
          AlteraParticipante('PROCESSA', 0);
          qryDetalhe.next;
       end;
    end;
end;

procedure TfrmReajustaSalarioMantido.bbtnInverterSelecaoClick(
  Sender: TObject);
begin
  inherited;
  if not(qryDetalhe.isEmpty) then
    begin
      qryDetalhe.first;
      while not(qryDetalhe.eof)do
       begin
          AlteraParticipante('PROCESSA', qryDetalhe.fieldbyname('PROCESSA').asInteger);
          qryDetalhe.next;
       end;
    end;
end;

procedure TfrmReajustaSalarioMantido.bbtnPosicionarClick(Sender: TObject);
begin
  inherited;
     if not(qryDetalhe.locate('MATRICULA', edtPosicionar.text,[loCaseInsensitive])) then
       begin
        MsgDlg('Matrícula não encontrada!','Matrícula',mtInformation,[mbOk],0);
        edtPosicionar.Text := '';
        SelecionaItemGrid(false);
       end
     else
      SelecionaItemGrid(true);
      edtPosicionar.Text := '';
end;

procedure TfrmReajustaSalarioMantido.bbtnAlterarClick(Sender: TObject);

begin
  inherited;
  try
   FrmAlteraSalario:= TFrmAlteraSalario.Create(self);
   FrmAlteraSalario.edtSalario.text:= qryDetalhe.fieldbyname('SALMANTIDO').asString;
   FrmAlteraSalario.lblMatricula.Caption:= 'Matrícula ' + qryDetalhe.fieldbyname('MATRICULA').asString;
   FrmAlteraSalario.ShowModal;

  if FrmAlteraSalario.ModalResult = mrOK then
     AlteraParticipante('SALARIO', frmAlteraSalario.edtSalario.value);


   if dtmBaseDados.dbBaseDados.inTransaction then
      bbtnProcessarReajuste.Enabled := False;

  finally
    FreeAndNil(FrmAlteraSalario);
  end;
end;

function TfrmReajustaSalarioMantido.AlteraParticipante(
  Coluna: String; dValor: double): boolean;

  var sSql: String;
begin
  qryDetalhe.edit;
  if(Coluna = 'SALARIO')   then
    begin

    qryDetalhe.fieldbyname('SALMANTIDO').AsFloat:= dValor;

    sSql:= 'UPDATE PARTPREVPLAN' +
   ' SET SALMANTIDO = ' + StringReplace(qryDetalhe.fieldbyname('SALMANTIDO').AsString, ',','.',[]) +
   ' WHERE IDPESSOA = ' + qryDetalhe.fieldbyname('IDPESSOA').AsString +
   ' AND IDPESSJUR = ' + qryDetalhe.fieldbyname('IDPESSJUR').AsString +
   ' AND IDPLANOPREV = ' + qryDetalhe.fieldbyname('IDPLANOPREV').AsString;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(sSql);

    try
      if not dtmBaseDados.dbBaseDados.inTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;
       qryAux.ExecSQL;
    except on E:EDBEngineError do
            begin
              if not dtmBaseDados.dbBaseDados.inTransaction then
                 dtmBaseDados.dbBaseDados.rollback;
                 MostrarErro(E);
                 Exit;
            end;
    end;

    end
else if(Coluna = 'PROCESSA') then
  begin
      if(dValor = 0) then
        qryDetalhe.fieldbyname('PROCESSA').asInteger:= 1
      else
        qryDetalhe.fieldbyname('PROCESSA').asInteger:= 0;
   end;
  qryDetalhe.post;
end;


procedure TfrmReajustaSalarioMantido.dbgrdDetalheEnter(Sender: TObject);
begin
  inherited;
  SelecionaItemGrid(true);
end;


procedure TfrmReajustaSalarioMantido.SelecionaItemGrid(bSelecionado: boolean);
begin
  if not bSelecionado then
    dbgrdDetalhe.Options:= dbgrdDetalhe.Options - [dgAlwaysShowSelection]
  else
    dbgrdDetalhe.Options:= dbgrdDetalhe.Options + [dgAlwaysShowSelection];

  //bbtnAlterar.Enabled:= bSelecionado;
end;

//Taffarel - SIG41789 - fim

end.
