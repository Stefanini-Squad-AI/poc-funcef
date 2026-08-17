// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  27/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
// Autor(a)    : Camille
// Data        : 08.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FParamRelInterfaceEnvio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,  Controls, Forms, Dialogs,
  FOkCancelar, Buttons, StdCtrls, checklst,  wwdblook,  IvDictio,   IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, TB97,    Db,   DBTables,
  Wwquery, MontaSelect, Mask, wwdbedit, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls,UFuncoesUteis, Wwdbgrd2, CMDBLookupCombo, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Spin;

type
  TfrmParamRelInterfaceEnvio = class(TfrmOkCancelar)
    odTxt                  : TOpenDialog;
    Label1                 : TLabel;
    Label5                 : TLabel;
    dsPatro                : TwwDataSource;
    dsPlanos               : TwwDataSource;
    pnlGeral               : TPanel;
    tbsPlanos              : TTabSheet;
    Splitter1              : TSplitter;
    tbsContrib             : TTabSheet;
    pgctrlPlanos           : TPageControl;
    scrllContrib           : TScrollBox;
    pgctrlInterface        : TPageControl;
    SplitterContrib        : TSplitter;
    dblookupPatrocinadora  : TCMDBLookupCombo;
    scrllModulo: TScrollBox;

    qryPlanos            : TwwQuery;
    qryPlanosNOME        : TStringField;
    qryPlanosIDPESSJUR   : TFloatField;
    qryPlanosIDPLANOPREV : TFloatField;

    qryPatro             : TwwQuery;
    qryPatroNOME         : TStringField;
    qryPatroIDPESSOA     : TFloatField;
    rdgrpind: TRadioGroup;
    grpMesAno: TGroupBox;
    lblAnoMes: TLabel;
    lblMes: TLabel;
    seAno: TSpinEdit;
    cboxMes: TComboBox;
    qryRubrica: TwwQuery;
    dsRubrica: TwwDataSource;
    qryAux: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    scrlPlanos: TScrollBox;
    clbPlanos: TCheckListBox;
    pgctrlModulo: TPageControl;
    tbsModulo: TTabSheet;
    ScrollBox1: TScrollBox;
    clbModulo: TCheckListBox;
    scrlOpcoes: TScrollBox;
    clbOpcoes: TCheckListBox;
    scrllRubrica: TScrollBox;
    pgctrlRubrica: TPageControl;
    tbsRubrica: TTabSheet;
    ScrollBox2: TScrollBox;
    clbRubrica: TCheckListBox;
    bbtnTodas: TBitBtn;
    bbtnInverte: TBitBtn;    
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnTodasClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure dblookupPatrocinadoraChange(Sender: TObject);
  private

    MesAno,Mes  : String;

    procedure AtualizarDados;

  public
    {-----}
  end;

var
  frmParamRelInterfaceEnvio: TfrmParamRelInterfaceEnvio;
  LstPlano , LstRubrica :TStringList;

implementation

uses uDataBase, uSistema, uMensErro, uSincronismo, DRelatorios, UAdmPrev;

{$R *.DFM}     

Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                           Lista: TStringList; Chave, Descricao:String);
begin
  Lista.Clear;
  ChkList.Clear;
  while Not Query.Eof Do Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    Query.Next;
  end;
end;

procedure TfrmParamRelInterfaceEnvio.AtualizarDados;
var  // Abre as Queries de Patrocinadoras, Planos da Patroc e Rubricas.
 lIdPessoa: LongInt;
begin
  if qryPatro.Active then
   lIdPessoa := qryPatro.FieldByName('IDPESSOA').AsInteger
  else
   lIdPessoa := -1;

  //Fechando as Queries;

  qryPlanos.Close;
  qryPatro.Close;

  //Abrindo as Queries;
  with qryPatro do
  begin
    ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
    Open;

    if lIdPessoa <> -1 then
     Locate('IDPESSOA', lIdPessoa, [loCaseInsensitive]);
  end;
  qryPlanos.Open;

  //Atualizando o CheckListBox de Planos;
  with clbPlanos do
  begin
    Items.Clear;

    while not qryPlanos.EOF do
    begin
      Items.Add(qryPlanos.FieldByName('NOME').AsString);
      Checked[Items.Count - 1] := True; //Marcando o Item que foi adicionado;
      qryPlanos.Next;
    end;

    qryPlanos.First;
    ItemIndex    := 0;
  end;
end;   

procedure TfrmParamRelInterfaceEnvio.bbtnConfirmarClick(Sender: TObject);
var
  I ,NumOpcoes,iIdFundacao : integer;
  sFlgTipoDesc , StrPlano, StrRubrica, sFlgTipoMod: string;
begin
  inherited;

  //Inicializando as variáveis;
  StrPlano := '';
  StrRubrica := '';
  sFlgTipoMod := '';

  //Critica Dados
  if Trim(dblookupPatrocinadora.Text) = '' then
  begin
    MsgDlg('Atenção! Nenhuma Patrocinadora foi especificada.', 'Erro', mtError, [mbOK], 0);
    dblookupPatrocinadora.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;

   If (cboxMes.Text = '')  Then Begin
    ShowMessage('Faltam Preencher Campos ...');
    cboxMes.SetFocus;
    ModalResult := mrNone;
    Exit;
  End;

  // Transforma data em AnoMes
  if (cboxMes.ItemIndex + 1) < 9 then
    Mes := '0'+IntToStr((cboxMes.ItemIndex + 1))
  else
    Mes := IntToStr((cboxMes.ItemIndex + 1));

  MesAno :=  IntToStr(seAno.Value) + '/' + Mes ;

  // Gera Linha com os Planos
  For I := 0 to clbPlanos.Items.Count -1 do Begin
    If clbPlanos.Checked[I] = True Then begin
      StrPlano := StrPlano + LstPlano.Strings[I] +  ',';
    end;
  end;

  StrPlano := Trim(Copy(StrPlano,1,((Length(StrPlano)-1))));

  // Gera Lista de Rubricas
   For I := 0 to clbRubrica.Items.Count -1 do Begin
    If clbRubrica.Checked[I] = True Then begin
      StrRubrica := StrRubrica + LstRubrica.Strings[I] +  ',';
    end;
  end;

  StrRubrica := Trim(Copy(StrRubrica,1,((Length(StrRubrica)-1))));

  NumOpcoes := 0;
  // Gera Linha de opcao
   for i := 0 to clbOpcoes.Items.Count - 1 do
       if clbOpcoes.Checked[i]
       then begin //
          NumOpcoes := 1;
          case i of
               0: //Benefícios;
                if sFlgTipoDesc = '' then
                 sFlgTipoDesc := '''B'''
                else
                 sFlgTipoDesc := sFlgTipoDesc + ', ''B''';

               1: //Contribuições Assistenciais;
                if sFlgTipoDesc = '' then
                 sFlgTipoDesc := '''A'''
                else
                 sFlgTipoDesc := sFlgTipoDesc + ', ''A''';

               2: //Contribuições de Empréstimo;
                if sFlgTipoDesc = '' then
                 sFlgTipoDesc := '''E'''
                else
                 sFlgTipoDesc := sFlgTipoDesc  + ', ''E''';

               4: //Taxas ou Valores das Contribuições Mensais;
                begin
                   if sFlgTipoDesc = '' then
                    sFlgTipoDesc := '''P'''
                   else sFlgTipoDesc := sFlgTipoDesc  + ', ''P''';
                end;
          end; // case
       end; // if

       If (NumOpcoes = 0)  Then Begin
        ShowMessage(' Preencher uma ou todas Opções ...');
        clbOpcoes.SetFocus;
        ModalResult := mrNone;
        Exit;
      End; 

   //Gera Linha de Módulo
   for i := 0 to clbModulo.Items.Count - 1 do
       if clbModulo.Checked[i]
       then begin //
          case i of
               0: //Assistencial;
                if sFlgTipoMod = '' then
                 sFlgTipoMod := '17'
                else
                 sFlgTipoMod := sFlgTipoMod + ', 17';

               1: //Benefício
                if sFlgTipoMod = '' then
                 sFlgTipoMod := '18'
                else
                 sFlgTipoMod := sFlgTipoMod + ', 18';

               2: // Empréstimo;
                if sFlgTipoMod = '' then
                 sFlgTipoMod := '15'
                else
                 sFlgTipoMod := sFlgTipoMod  + ', 15';

               3: //Previdencial;
                begin
                   if sFlgTipoMod = '' then
                    sFlgTipoMod := '16'
                   else sFlgTipoMod := sFlgTipoMod  + ', 16 ';
                end;
          end; // case
       end; // if

  case rdgrpind.itemindex of
    0:
    begin
      With dtmRelatorios.qryEnvioArqPatroAnal Do
      begin
        close;
        SQL.clear;
        SQL.add(' SELECT '+
                ' T.IDPESSJUR, PATRO.NOME, T.IDPLANOPREV, PL.NOME, M.NOMEMODULO,   ' +
                ' T.IDPROVENTO, RB.DESCRPROVDESC , PART.IDPESSOA, PART.NOME,       ' +
                ' EL.MATRICULA, PT.INSCRICAONUMERO, SUM(nvl(T.VALOR,0)) AS VALOR,  ' +
                ' COUNT(1) AS QUANTIDADE                                         ' + 
                ' FROM TMPDESC T, PESSOA PATRO ,  PESSOA PART, ELEGPATRO EL,  ' +
                '      PARTPREVPLAN PT, PLANPREV PL, RUBRICAXPESS RB, MODULO M'+
                ' WHERE '+
                //*  patrocinadora *
                ' (PATRO.IDPESSOA = ' +qryPatro.FieldByName('IDPESSOA').AsString+ ')'+
                ' AND (T.FLGDESCFOLHA = ''P'' ) '+
                //* parâmetro da tela MESREFERENCIA*
                ' AND (T.MESCOBRANCA = '+ QuotedStr(MesAno)   + ')');
                //* parâmetro de Módulo

                If sFlgTipoMod <> '' Then
                   SQL.add(' AND M.IDMODULO IN ('+sFlgTipoMod+')  ');
                //* parâmetro B - benefício, A - assistencial, E - Empréstimo, P - previdencial)

                 if not (clbOpcoes.Checked[3]) or (sFlgTipoDesc <> '') then
                   SQL.add(' AND T.FLGTIPODESC IN ('+sFlgTipoDesc+') ') ;

                // * parâmetro de Rubrica *
                If StrRubrica <> '' Then
                   SQL.add(' AND T.IDPROVENTO IN ('+StrRubrica+')  ');

                //* parâmetro de plano *
                If  StrPlano <> '' Then
                    SQL.add(' AND T.IDPLANOPREV IN ('+StrPlano+') ');

                SQL.add(' AND T.FLGINTEVENTO IS NULL  ');

                SQL.add(' AND PT.IDPESSOA = EL.IDPESSOA    ');
                SQL.add(' AND PT.IDPESSJUR = EL.IDPESSJUR  ');

                SQL.add(' AND PT.IDPESSJUR = PATRO.IDPESSOA ');

                SQL.add(' AND PT.IDPESSOA = PART.IDPESSOA   ');

                SQL.add(' AND PT.IDPLANOPREV = PL.IDPLANOPREV ');

                SQL.add(' AND PT.IDPESSJUR = T.IDPESSJUR  ');
                SQL.add(' AND PT.IDPLANOPREV = T.IDPLANOPREV ');
                SQL.add(' AND PT.IDPESSOA = T.IDPESSOA       ');
                SQL.add(' AND PT.SEQPROPOSTA = T.SEQPROPOSTA ');

                SQL.add(' AND T.IDMODULO = M.IDMODULO    ');

                SQL.add(' AND T.IDPESSJUR = RB.IDPESSOA      ');
                SQL.add(' AND T.IDPROVENTO = RB.IDRUBRICA    ');

                SQL.add('GROUP BY T.IDPESSJUR, PATRO.NOME,');
                SQL.add('T.IDPLANOPREV, PL.NOME, M.NOMEMODULO,');
                SQL.add('T.IDPROVENTO, RB.DESCRPROVDESC , ');
                SQL.add('PART.NOME, PART.IDPESSOA,  EL.MATRICULA, PT.INSCRICAONUMERO ');

                if (clbOpcoes.Checked[3])   then
                begin
                  SQL.add('UNION ALL');
                  SQL.add('SELECT   ');
                  SQL.add('T.IDPESSJUR, PATRO.NOME, T.IDPLANOPREV, PL.NOME, M.NOMEMODULO,  ');
                  SQL.add('T.IDPROVENTO, RB.DESCRPROVDESC , PART.IDPESSOA, PART.NOME,      ');
                  SQL.add('EL.MATRICULA, PT.INSCRICAONUMERO, SUM(nvl(T.VALOR,0)) AS VALOR, ');
                  SQL.Add(' COUNT(1) AS QUANTIDADE                                       '); 
                  SQL.add('FROM   TMPDESC T, PESSOA PATRO , PESSOA PART, ELEGPATRO EL,  ');
                  SQL.add('       PARTPREVPLAN PT,PLANPREV PL , RUBRICAXPESS RB, MODULO M ');
                  SQL.add('WHERE T.FLGDESCFOLHA = ''P'' ');
                  SQL.add(' AND  (PATRO.IDPESSOA = ' +qryPatro.FieldByName('IDPESSOA').AsString+ ')'+
                      ' AND (T.FLGDESCFOLHA = ''P'' ) '+
                      ' AND (T.MESCOBRANCA = '+ QuotedStr(MesAno)   + ')');

                  If sFlgTipoMod <> '' Then
                       SQL.add(' AND M.IDMODULO IN ('+sFlgTipoMod+')  ');
                      // * parâmetro de Rubrica *
                  If StrRubrica <> '' Then
                       SQL.add(' AND T.IDPROVENTO IN ('+StrRubrica+')  ');
                  //*eventos de inscrições e desligamentos que geram contribuições*

                  SQL.add('AND T.FLGTIPODESC = ''P'' ');
                  SQL.add('AND T.FLGINTEVENTO IN (''IP'', ''RM'', ''DC'', ''RA'', ''DM'', ''DS'', ''DA'') ');

                  //* parâmetro de plano *
                  If  StrPlano <> '' Then
                    SQL.add(' AND T.IDPLANOPREV IN ('+StrPlano+') ');

                  SQL.add(' AND PT.IDPESSOA = EL.IDPESSOA    ');
                  SQL.add(' AND PT.IDPESSJUR = EL.IDPESSJUR  ');

                  SQL.add(' AND PT.IDPESSJUR = PATRO.IDPESSOA ');

                  SQL.add(' AND PT.IDPESSOA = PART.IDPESSOA   ');

                  SQL.add(' AND PT.IDPLANOPREV = PL.IDPLANOPREV ');

                  SQL.add(' AND PT.IDPESSJUR = T.IDPESSJUR  ');
                  SQL.add(' AND PT.IDPLANOPREV = T.IDPLANOPREV ');
                  SQL.add(' AND PT.IDPESSOA = T.IDPESSOA       ');
                  SQL.add(' AND PT.SEQPROPOSTA = T.SEQPROPOSTA ');

                  SQL.add(' AND T.IDMODULO = M.IDMODULO    ');

                  SQL.add(' AND T.IDPESSJUR = RB.IDPESSOA      ');
                  SQL.add(' AND T.IDPROVENTO = RB.IDRUBRICA    ');

                  SQL.add('GROUP BY T.IDPESSJUR, PATRO.NOME,');
                  SQL.add('T.IDPLANOPREV, PL.NOME, M.NOMEMODULO,');
                  SQL.add('T.IDPROVENTO, RB.DESCRPROVDESC , ');
                  SQL.add('PART.NOME, PART.IDPESSOA , EL.MATRICULA, PT.INSCRICAONUMERO  ');
                end;
      end;
    end;

    1:
    begin
      With  dtmRelatorios.qryEnvioArqPatroSint Do
      begin
        close;
        SQL.clear;
        SQL.add(' SELECT '+
                ' T.IDPESSJUR, PATRO.NOME, T.IDPLANOPREV, PL.NOME, M.NOMEMODULO, '+
                ' T.IDPROVENTO, RB.DESCRPROVDESC , SUM(NVL(T.VALOR,0)) AS VALOR,   '+
                ' COUNT(1) AS QUANTIDADE                                          '+ 
                ' FROM TMPDESC T, PESSOA PATRO, PLANPREV PL, RUBRICAXPESS RB, MODULO M '+
                ' WHERE '+
                // *P - patrocinadora*
                ' (PATRO.IDPESSOA = ' +qryPatro.FieldByName('IDPESSOA').AsString+ ')'+
                ' AND (T.FLGDESCFOLHA = ''P'' ) '+
                // *parâmetro da tela MESREFERENCIA*
                ' AND (T.MESCOBRANCA = '+ QuotedStr(MesAno)   + ')');
                //* parâmetro de Módulo

                If sFlgTipoMod <> '' Then
                  SQL.add(' AND M.IDMODULO IN ('+sFlgTipoMod+')  ');
                // *parâmetro da Opcao B - benefício, A - assistencial, E - Empréstimo, P - previdencial) '+

                if not (clbOpcoes.Checked[3]) or (sFlgTipoDesc <> '') then
                   SQL.add(' AND T.FLGTIPODESC IN ('+sFlgTipoDesc+') ');

                // * parâmetro de Rubrica *
                If StrRubrica <> '' Then
                   SQL.add(' AND T.IDPROVENTO IN ('+StrRubrica+')  ');

                //* parâmetro de plano *
                If  StrPlano <> '' Then
                    SQL.add(' AND T.IDPLANOPREV IN ('+StrPlano+') ');

                SQL.add(' AND T.FLGINTEVENTO  IS NULL ');

                SQL.add(' AND T.IDPESSJUR = PATRO.IDPESSOA ');

                SQL.add(' AND T.IDPLANOPREV = PL.IDPLANOPREV ');

                SQL.add(' AND T.IDMODULO = M.IDMODULO    ');

                SQL.add(' AND T.IDPESSJUR = RB.IDPESSOA      ');
                SQL.add(' AND T.IDPROVENTO = RB.IDRUBRICA    ');

                SQL.add(' GROUP BY T.IDPESSJUR, PATRO.NOME,    ');
                SQL.add('          T.IDPLANOPREV, PL.NOME, M.NOMEMODULO, ');
                SQL.add('          T.IDPROVENTO, RB.DESCRPROVDESC  ');

                //Se Opção "Inscritos e Desligados" estiver marcada
                if clbOpcoes.Checked[3]  then
                   begin
                      SQL.add('UNION ALL');
                      SQL.add('SELECT   ');
                      SQL.add('T.IDPESSJUR, PATRO.NOME, T.IDPLANOPREV, PL.NOME ,M.NOMEMODULO, ');
                      SQL.add('T.IDPROVENTO, RB.DESCRPROVDESC , SUM(nvl(T.VALOR,0)) AS VALOR, ');
                      SQL.Add(' COUNT(1) AS QUANTIDADE                                       '); 
                      SQL.add('FROM TMPDESC T, PESSOA PATRO, PLANPREV PL, RUBRICAXPESS RB, MODULO M ');
                      SQL.add('WHERE T.FLGDESCFOLHA = ''P'' ');
                      SQL.add(' AND  (PATRO.IDPESSOA = ' +qryPatro.FieldByName('IDPESSOA').AsString+ ')'+
                      ' AND (T.FLGDESCFOLHA = ''P'' ) '+
                      ' AND (T.MESCOBRANCA = '+ QuotedStr(MesAno)   + ')');
                      If sFlgTipoMod <> '' Then
                        SQL.add(' AND M.IDMODULO IN ('+sFlgTipoMod+')  ');
                      // * parâmetro de Rubrica *
                      If StrRubrica <> '' Then
                         SQL.add(' AND T.IDPROVENTO IN ('+StrRubrica+')  ');
                      //*eventos de inscrições e desligamentos que geram contribuições*
                      SQL.add('AND T.FLGTIPODESC = ''P'' ');
                      SQL.add('AND T.FLGINTEVENTO IN (''IP'', ''RM'', ''DC'', ''RA'', ''DM'', ''DS'', ''DA'') ');

                     //* parâmetro de plano *
                     If  StrPlano <> '' Then
                      SQL.add(' AND T.IDPLANOPREV IN ('+StrPlano+') ');

                      SQL.add(' AND T.IDPESSJUR = PATRO.IDPESSOA ');

                      SQL.add(' AND T.IDPLANOPREV = PL.IDPLANOPREV ');

                      SQL.add(' AND T.IDMODULO = M.IDMODULO    ');

                      SQL.add(' AND T.IDPESSJUR = RB.IDPESSOA      ');
                      SQL.add(' AND T.IDPROVENTO = RB.IDRUBRICA    ');

                      SQL.add('GROUP BY T.IDPESSJUR, PATRO.NOME, ' );
                      SQL.add('T.IDPLANOPREV, PL.NOME, M.NOMEMODULO, ');
                      SQL.add('T.IDPROVENTO, RB.DESCRPROVDESC     ');
                   end;
      end;
    end;
  end;
  dtmRelatorios.LbMesReferencia.Caption := cboxMes.Text + ' / ' + seAno.Text;
  dtmRelatorios.LbMesReferenciaSint.Caption := cboxMes.Text + ' / ' + seAno.Text;

end;

procedure TfrmParamRelInterfaceEnvio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Fechando as Queries;

  qryPlanos.Close;
  qryPatro.Close;
  qryRubrica.Close;

  LstPlano.Free;
  LstRubrica.Free;
  inherited;
end;

procedure TfrmParamRelInterfaceEnvio.FormCreate(Sender: TObject);
var
 i: Integer;
begin
  inherited;

  //Henrique Massão
  OdTxt.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Marcando todas as Opções de Envio;
  for i := 0 to clbOpcoes.Items.Count - 1 do
    clbOpcoes.Checked[i] := False;
end;

procedure TfrmParamRelInterfaceEnvio.FormShow(Sender: TObject);
begin
  inherited;
  LstRubrica        := TStringList.Create;
  LstPlano          := TStringList.Create;

  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;

  with qryPatro do //Selecionando automaticamente a Primeira Patrocinadora da Lista;
  begin
    if RecordCount > 0 then
     dblookupPatrocinadora.Text := FieldByName('NOME').AsString;
  end;

  with  qryPlanos do
  begin
    close;
    ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
    open;
  end;

  with  qryRubrica do
  begin
    close;
    ParamByName('IDPESSOA').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
    open;
  end;   

  CriaLista(clbPlanos,qryPlanos,LstPlano,'IDPLANOPREV','NOME');

  CriaLista(clbRubrica,qryRubrica,LstRubrica,'IDRUBRICA','DESCRPROVDESC');
end;

procedure TfrmParamRelInterfaceEnvio.bbtnCancelarClick(Sender: TObject);
Var
   I : Integer;
begin
  inherited;

  dblookupPatrocinadora.Text := '';
  dblookupPatrocinadora.SetFocus ;
  cboxMes.Text := '';
  
  For I := 0 To clbOpcoes.Items.Count - 1 Do
     clbOpcoes.Checked[I] := False;

  For I := 0 To clbPlanos.Items.Count - 1 Do
     clbPlanos.Checked[I] := False;

  For I := 0 To clbModulo.Items.Count - 1 Do
     clbModulo.Checked[I] := False;

  For I := 0 To clbModulo.Items.Count - 1 Do
    clbModulo.Checked[I] := False;
end;

procedure TfrmParamRelInterfaceEnvio.bbtnTodasClick(Sender: TObject);
var
 i: Integer;
begin
  inherited;
  for I := 0 to clbOpcoes.Items.Count - 1 do
    clbOpcoes.checked[I]:= True;
end;

procedure TfrmParamRelInterfaceEnvio.bbtnInverteClick(Sender: TObject);
var
 i: Integer;
begin
  inherited;
  for I := 0 to clbOpcoes.Items.Count - 1 do
    clbOpcoes.Checked[I] := Not clbOpcoes.Checked[I];
end;

procedure TfrmParamRelInterfaceEnvio.dblookupPatrocinadoraChange(
  Sender: TObject);
begin
  inherited;

  with  qryPlanos do
  begin
    close;
    ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
    open;
  end;

  CriaLista(clbPlanos,qryPlanos,LstPlano,'IDPLANOPREV','NOME');

  qryRubrica.Close;
  qryRubrica.ParamByName('IDPESSOA').Value :=  qryPatro.FieldbyName('IDPESSOA').AsInteger;
  qryRubrica.Open;

  CriaLista(clbRubrica,qryRubrica,LstRubrica,'IDRUBRICA','DESCRPROVDESC');
end;

end.


