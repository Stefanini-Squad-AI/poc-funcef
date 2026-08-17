unit FGeraArquivoConsignatario;

// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Data        : 31/05/2008
// Rotina      : Qry
// Pendência   : 21964 (ReAbertura)
// Descricao   : Novos parametros para o IntBanco.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 20/09/2006
// Rotina      : Diversas
// Pendência   : 23361
// Descricao   : Retirar RULE de consultas.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 15/12/2005
// Rotina      : Evento Confirmar do botão OK
// Pendência   : 21046
// Descricao   : Aparece a mensagem do Oracle ORA-01002: fetch out of sequence,
//               mas o processo é concluído com sucesso. Coloquei um start
//               Transaction, antes do código de geração do arquivo texto
//               visto que pode ocorrer o seguinte (retirado do help do ORACLE:
//               "This may be caused by fetching from a SELECT FOR UPDATE cursor after a commit."
//--------------------------------------------------------------------------------------------------
{==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uBiblioteca    |
| pela uString.                                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/01/2004 A 28/01/2004                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CRIAÇÃO DA TELA                                                            |
|                                                                              |
|------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, ComCtrls, Db, DBTables, Wwquery,
  CheckLst, BfDialogs, BrowseFolder, uProcuraDir, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlIntBanco, uDocumento, Provider, DBClient, uCmSQLParams, uConstFolha,uSistema;

Type
  TfrmGeraArquivoConsignatario = class(TfrmOkCancelar)
    Panel1: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cbMes: TComboBox;
    edAno: TEdit;
    UpDown1: TUpDown;
    pnlCodRub: TPanel;
    qryAux: TwwQuery;
    Panel5: TPanel;
    Label3: TLabel;
    chkVersao: TCheckListBox;
    pdirdlgPasta: TProcuraDirDlg;
    lbProcessando: TLabel;
    Panel2: TPanel;
    rgTipo: TRadioGroup;
    Label4: TLabel;
    edRubrica: TEdit;
    lblportformaPA: TLabel;
    dblkupPortFormaPA: TwwDBLookupCombo;
    qryRegistro1: TwwQuery;
    dsRegistro: TwwDataSource;
    btnBusca: TButton;
    qryPortadorForma1: TwwQuery;
    GroupBox2: TGroupBox;
    edDataFolha: TCMDateTimePicker;
    cboxGeraDoc: TCheckBox;
    dsRateioComArq: TwwDataSource;
    qryRateioComArq: TwwQuery;
    qryRateioSemArq: TwwQuery;
    dsRateioSemArq: TwwDataSource;
    PageControl1: TPageControl;
    tbsArquivo: TTabSheet;
    dbgArquivo: TwwDBGrid;
    tbsDocComArq: TTabSheet;
    lblTotalArquivo: TLabel;
    lblTotalDocComArq: TLabel;
    dbgDocComArq: TwwDBGrid;
    TabSheet1: TTabSheet;
    lblTotalDocSemArq: TLabel;
    dbgDocSemArq: TwwDBGrid;
    cboxgravaarq: TCheckBox;
    cboxGeraDocArq: TCheckBox;
    cboxDocSemArq: TCheckBox;
    cdsRegistro: TClientDataSet;
    cmSQLRegistro: TCMSQLParams;

    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbMesChange(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);


  private // Private declarations

    ListaVersao : TStringList;
    sVersaoSel  : String;

    procedure MontaVersao;
    procedure AbreMontaQuery;
    function  ObtemValor(aqry: tdataset; ascampo: String): Real;
    procedure MsgErro(sMsg: String);


  public  // Public declarations

    Documento     : TDocumento;
    fCtrlIntBanco : TCtrlIntBanco;

    function ProcessarSaida(aifavorecido      : Integer;
                            asNomeFavorecido  : String;
                            sFiltroVersao     : String;
                            sMes              : String
                           ): boolean;


  end;



var
  frmGeraArquivoConsignatario: TfrmGeraArquivoConsignatario;



implementation
{$R *.DFM}
uses
  UMensErro, UDatabase, UIntegraBack, uAdmPrevFB, Dbasedados, UobjFolha, uFuncoesFolha, fAguarde;



procedure TfrmGeraArquivoConsignatario.FormShow(Sender: TObject);
var
  dia : Word;
  mes : Word;
  ano : Word;
begin
  inherited;
  DecodeDate(Date, ano, mes, dia);

  edAno.Text      := IntToStr(ano);
  cbMes.ItemIndex := (mes - 1);

  MontaVersao;

  WindowState     := wsMaximized;
end;



function TfrmGeraArquivoConsignatario.ProcessarSaida(aifavorecido      : Integer;
                                                     asNomeFavorecido  : String;
                                                     sFiltroVersao     : String;
                                                     sMes              : String
                                                    ): boolean;
begin
  //
end;



procedure TfrmGeraArquivoConsignatario.bbtnConfirmarClick(Sender: TObject);
var
  sPathArquivoRem : String;
  ddatafloat      : TDateTime;
  iplncodigo      : Integer;
  iNumLancto      : Integer;
  iCodDoc         : Integer;
  rvalor          : Real;
  lii             : Integer;
  ifavorecido     : Integer;
  ListaFav        : TStringList;
  sNome           : String;
  licodportforma  : Integer; 
begin
  inherited;

  if not dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.StartTransaction;

  try
    try
      qryPortadorForma1.Locate('CODPORTFORMA', cdsRegistro.fieldbyname('CODPORTFORMA').asinteger,[]);

      lbProcessando.Visible:=True;
      self.update;

      fCtrlIntBanco := TCtrlIntBanco.Create;
      fCtrlIntBanco.Initialize(dtmBaseDados.DbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True,
                               MsgErro
                              );

      fCtrlIntBanco.FechaQryTexto := True;

      if cboxgravaarq.Checked then
      begin
        if qryPortadorForma1.FieldByName('PATHARQUIVOREM').isnull or
           (qryPortadorForma1.FieldByName('PATHARQUIVOREM').asString = '') then

          //Jéssica Lana SOL 109421 KINTANA 496332
          //sPathArquivoRem:='C:\'
          sPathArquivoRem:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)

        else
          sPathArquivoRem:=qryPortadorForma1.FieldByName('PATHARQUIVOREM').asString;

        fCtrlIntBanco.IndiceDoBanco:=qryPortadorForma1.FieldByName('CodArquivoRemessa').AsInteger;

        if fCtrlIntBanco.VerficaDadosEmpresa('P', qryPortadorForma1.FieldByName('CodPortForma').AsInteger) then
        begin
          if fCtrlIntBanco.ValidaRemessa('P', cdsRegistro.data, False) then
          begin
            FrmAguarde.Apaga;
            fCtrlIntBanco.ExibeArquivoGerado:=False;
            ddatafloat:=strtodate(edDataFolha.Text);
            fCtrlIntBanco.IdentficaOrigem:='18';

            fCtrlIntBanco.iFloatExterno    := 0;
            fCtrlIntBanco.iFloatExternoAlt := 0;

            fCtrlIntBanco.DataPagamento    := DateToStr(ddatafloat);

            fCtrlIntBanco.MontaPagamentoEletronico(
              qryPortadorForma1.FieldByName('CodArquivoRemessa').AsInteger,
              qryPortadorForma1.FieldByName('ControleRemessa').AsInteger,
              cdsRegistro.data,sPathArquivoRem);
          end
          else
          begin
            ShowMessage('Erro na geração do arquivo de remessa.');
          end;
        end;
      end;

      FrmAguarde.Apaga;

    except
      on E:Exception do
      begin
        MsgDlg('Erro no processo de geração do Arquivo de Remessa de Pagamento' + E.Message, 'Erro', mtError, [mbOk, mbHelp], 0);
        Repaint;
      end;
    end;

  finally
    fCtrlIntBanco.Free;
    bbtnSair.Enabled:=True;
    lbProcessando.Visible:=False;
  end;

  //GERA DOCUMENTO FINANACEIRO
  if cboxGeraDoc.checked then
  begin
    Documento:=TDocumento.Create;

    iplncodigo:=0;

    if cboxGeraDocArq.checked then
    begin
      //GERA DOCUMENTO RELATIVO AO ARQUIVO ELETRONICO
      iCodDoc:=Documento.GetCodigo(qryAux);
      if icoddoc > 0 then
      begin
        qryRateioComArq.first; 

        rvalor:=ObtemValor(qryRateioComArq, 'valor');
        if rvalor > 0 then
        begin
          Documento.Inserir(qryAux, iCodDoc,
            IntToStr(Sistema.IdModulo),
            IntToStr(IntegraBack.Plano),
            qryRateioComArq.fieldbyname('PLACONTA').asString,
            '', // sCCustoCliFor
            -1, // iMoeCodigo (nao é em outra moeda)
            -1,
            Sistema.IdEmpresa,
            752961, // IdForCli
            StrToInt(prmCodTipDoc),
            qryPortadorForma1.FieldByName('CODPORTFORMA').AsInteger,
            'P', // recpag
            StrtoFloat(floattostr(date)+'752961'),
            '',
            FormatDateTime('DD/MM/YYYY', date), // DataEmissao
            FormatDateTime('dd/mm/yyyy', edDataFolha.date),
            FormatDateTime('dd/mm/yyyy', edDataFolha.date),
            '0', // sStatus
            -1,  // iNumFatura
            '2', // sOperacao
            Sistema.IdUsuario,
            -1,
            qryPortadorForma1.FieldByName('CODFORMA').AsInteger,
            '','',False,0,0,0);

          iNumLancto:=Documento.GerarNumLancto(qryAux, iCodDoc);
          if iNumLancto > 0 then
          begin
            Documento.CriarLanctoDoc(
              qryAux,
              iCodDoc,
              iNumLancto,
              -1,
              iplncodigo,
              FormatDateTime('dd/mm/yyyy', date),
              rvalor,
              0,
              -1,
              'C',
              '2', // sOperacao
              'Pagamento de Consignação',
              Sistema.IdUsuario,
              False,
              qryPortadorForma1.FieldByName('CODPORTFORMA').AsInteger,
              '');

            while not qryRateioComArq.EOF do
            begin
              Documento.Rateio.Inserir(
                iCodDoc,
                qryRateioComArq.fieldbyname('CODTIPRECDESFAV').asString,
                'P',
                qryRateioComArq.fieldbyname('CODCENTRORESPON').asString,
                Sistema.IdEmpresa,
                qryRateioComArq.fieldbyname('VALOR').asfloat,
                0,
                Sistema.IdUsuario,
                qryRateioComArq.fieldbyname('UNIDNEGOC').asinteger,
                -1,
                SistemaFolha.CODCCUSTOFINAN,
                qryRateioComArq.fieldbyname('IDPATRO').asinteger,
                SistemaFolha.IdProgramaFolha,
                qryRateioComArq.fieldbyname('IDPLANOCONTABIL').asinteger);

              qryRateioComArq.next;
            end;
          end;
        end;
      end;
    end;

    if cboxDocSemArq.checked then
    begin
      //GERA DOCUMENTO DOS CONSIGNATÁRIOS SEM ARQ ELET
      ListaFav:=TStringList.Create;

      ifavorecido:=0;
      rvalor:=0;
      sNome:='';
      licodportforma:=0; 
      qryRateioSemArq.first;
      while not qryRateioSemArq.EOF do
      begin
        if (ifavorecido <> qryRateioSemArq.fieldbyname('IDFAVORECIDO').asinteger) then
        begin
          if ifavorecido <> 0 then
          begin
            ListaFav.Add(inttostr(ifavorecido)+';'+floattostr(rvalor)+';'+
              sNome+';'+
              inttostr(licodportforma));
          end;
          rvalor:=0;
          ifavorecido:=qryRateioSemArq.fieldbyname('IDFAVORECIDO').asInteger;
          licodportforma:=qryRateioSemArq.fieldbyname('CODPORTFORMA').asInteger; 
        end;
        try
          rvalor:=rvalor+qryRateioSemArq.fieldbyname('VALOR').asfloat;
          sNome:=qryRateioSemArq.fieldbyname('NOME').asString;
        except
        end;
        qryRateioSemArq.next;
      end;

      if ifavorecido <> 0 then
      begin
        ListaFav.Add(
          inttostr(ifavorecido)+';'+
          floattostr(rvalor)+';'+
          sNome+';'+
          //INCLUSÃO DO PORTADOR FORMA DO ÚLTIMO FAVORECIDO
          inttostr(licodportforma));
      end;

      for lii:=0 to ListaFav.count-1 do
      begin
        try
          ifavorecido:=strtoint(Piece(ListaFav[lii],';',1));
        except
        end;
        sNome:=Piece(ListaFav[lii],';',3);
        try
          rvalor:=strtofloat(Piece(ListaFav[lii],';',2));
        except
        end;
        try
          licodportforma:=strtoint(Piece(ListaFav[lii],';',4));
        except
        end;
        qryPortadorForma1.Locate('CODPORTFORMA', licodportforma, []);

        if (ifavorecido > 0) and (rvalor > 0) then
        begin
          iCodDoc:=Documento.GetCodigo(qryAux);
          if icoddoc > 0 then
          begin
            qryRateioSemArq.first; 

            Documento.Inserir(qryAux, iCodDoc,
              IntToStr(Sistema.IdModulo),
              IntToStr(IntegraBack.Plano),
              qryRateioSemArq.fieldbyname('PLACONTA').asString,
              '', // sCCustoCliFor
              -1, // iMoeCodigo (nao é em outra moeda)
              -1,
              Sistema.IdEmpresa,
              ifavorecido, // IdForCli
              StrToInt(prmCodTipDoc),
              qryPortadorForma1.FieldByName('CODPORTFORMA').AsInteger,
              'P', // recpag
              StrtoFloat(floattostr(date)+inttostr(ifavorecido)),
              '',
              FormatDateTime('DD/MM/YYYY', date), // DataEmissao
              FormatDateTime('dd/mm/yyyy', edDataFolha.date),
              FormatDateTime('dd/mm/yyyy', edDataFolha.date),
              '0', // sStatus
              -1,  // iNumFatura
              '2', // sOperacao
              Sistema.IdUsuario,
              -1,
              qryPortadorForma1.FieldByName('CODFORMA').AsInteger,
              '','',False,0,0,0);

            iNumLancto:=Documento.GerarNumLancto(qryAux, iCodDoc);
            if iNumLancto > 0 then
            begin
              Documento.CriarLanctoDoc(
                qryAux,
                iCodDoc,
                iNumLancto,
                -1,
                iplncodigo,
                FormatDateTime('dd/mm/yyyy', date),
                rvalor,
                0,
                -1,
                'C',
                '2', // sOperacao
                copy('Pagto Consig ' + sNome, 1, 60),
                Sistema.IdUsuario,
                False,
                qryPortadorForma1.FieldByName('CODPORTFORMA').AsInteger,
                '');

              while not qryRateioSemArq.EOF do
              begin
                if (ifavorecido = qryRateioSemArq.fieldbyname('IDFAVORECIDO').asinteger) then
                begin
                  Documento.Rateio.Inserir(
                    iCodDoc,
                    qryRateioSemArq.fieldbyname('CODTIPRECDESFAV').asString,
                    'P',
                    qryRateioSemArq.fieldbyname('CODCENTRORESPON').asString,
                    Sistema.IdEmpresa,
                    qryRateioSemArq.fieldbyname('VALOR').asfloat,
                    0,
                    Sistema.IdUsuario,
                    qryRateioSemArq.fieldbyname('UNIDNEGOC').asinteger,
                    -1,
                    SistemaFolha.CODCCUSTOFINAN,
                    qryRateioSemArq.fieldbyname('IDPATRO').asinteger,
                    SistemaFolha.IdProgramaFolha,
                    qryRateioSemArq.fieldbyname('IDPLANOCONTABIL').asinteger);
                end;

                qryRateioSemArq.next;
              end;
            end;
          end;
        end;
      end;
      ListaFav.free;
    end;

    Documento.Free;

    if (MsgDlg('Confirma gravação dos documentos ? (S/N)',
               'Informação', mtInformation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
    begin
      if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.commit;
    end;
  end;
end;



procedure TfrmGeraArquivoConsignatario.MontaVersao;
var sSQL, sMes: String;
begin
  sMes:=edAno.Text;
  if cbMes.ItemIndex > 8 then
    sMes:=sMes + '/' + IntToStr(cbMes.ItemIndex + 1)
  else
    sMes:=sMes + '/0' + IntToStr(cbMes.ItemIndex + 1);

  sSQL:=' SELECT IDHSTFOLHABENEF, HISTORICO AS DESCR, '+
          ' IDHSTFOLHABENEF ||''-''|| HISTORICO AS DESCRICAO '+
          ' FROM HSTFOLHABENEF '+
          ' WHERE FLGESTADO <> 2 '+
          ' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
          ' AND MESREFERENCIA = '+QuotedStr(sMes)+' '+
          ' ORDER BY IDHSTFOLHABENEF DESC ';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  chkVersao.Clear;
  ListaVersao.clear; 

  while not(qryAux.EOF) Do
  begin
    chkVersao.Items.Add(qryAux.FieldByName('DESCRICAO').asString);
    chkVersao.ItemIndex:=0;
    ListaVersao.Add(qryAux.FieldByName('IDHSTFOLHABENEF').AsString);
    qryAux.Next;
  end;
end;



procedure TfrmGeraArquivoConsignatario.FormCreate(Sender: TObject);
begin
  inherited;
  ListaVersao := TStringList.Create;
  qryPortadorforma1.open;
end;



procedure TfrmGeraArquivoConsignatario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaVersao.free;
  inherited;
end;



procedure TfrmGeraArquivoConsignatario.cbMesChange(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := True;
  MontaVersao;
end;



function TfrmGeraArquivoConsignatario.ObtemValor(aqry: tdataset; ascampo: String): Real;
var
  rValor : Real;
begin
  aqry.first;
  aqry.disablecontrols;
  rvalor:=0;
  while not aqry.EOF do
  begin
    try
      rvalor:=rvalor+aqry.fieldbyname(ascampo).asfloat;
    except
    end;
    aqry.next;
  end;
  aqry.enablecontrols;
  aqry.first;
  result:=rvalor;
end;



procedure TfrmGeraArquivoConsignatario.AbreMontaQuery;
var
  sSQL      : String;
  sListaFav : String;
begin
  lbProcessando.Visible := True;

  MontaFiltroCompleto(chkVersao, ListaVersao, sVersaoSel);

  if rgTipo.itemindex = 0 then
  begin
    // ---------------------------------------------------------------------------------------------
    sSQL:=
    'SELECT DISTINCT '                                                                              + #13 +
    '  DECODE(H.FLGDESCONTO,1,H.PLACONTAC,H.PLACONTAD) AS CONTALIQUIDO, '                           + #13 +
    '  H.IDFAVORECIDO AS IDPESSOA, '                                                                + #13 +
    '  PF.NOME, '                                                                                   + #13 +
    '  PF.NOME AS RAZAOSOCIAL, '                                                                    + #13 +
    '  PF.NUMDOCUMENTO, '                                                                           + #13 +
    '  CB.CONTACORRENTE, '                                                                          + #13 +
    '  AG.NUMAGENCIA , '                                                                            + #13 +
    '  BC.NUMBANCO AS CODBANCOFAVORECIDO, '                                                         + #13 +
    '  ' + ''' '' LOGRADOURO, '                                                                     + #13 +
    '  ' + ''' '' NUMERO, '                                                                         + #13 +
    '  ' + ''' '' COMPLEMENTO, '                                                                    + #13 +
    '  ' + ''' '' BAIRRO, '                                                                         + #13 +
    '  ' + ''' '' CIDADE, '                                                                         + #13 +
    '  ' + ''' '' CODESTADO, '                                                                      + #13 +
    '  ' + ''' '' CEP, '                                                                            + #13 +
    '  H.IDFAVORECIDO AS IDFORCLI, '                                                                + #13 +
    '  NVL(D.MATRICULA,E.MATRICULA) AS CODDOCUMENTO, '                                              + #13 +
    '  SUM(H.VALORPROVENTO) AS VALOR, '                                                             + #13 +
    '  0.00 VALORDESCONTO, '                                                                        + #13 +
    '  0.00 VALORJUROS, '                                                                           + #13 +
    '  ' + QuotedStr(formatdatetime('DD/MM/YYYY', edDataFolha.date))         + ' DATAVENCTO, '            + #13 +
    '  ' + QuotedStr(formatdatetime('DD/MM/YYYY', edDataFolha.date))         + ' DATAPROGRAMADA, '        + #13 +
    '  0 TIPOMOEDA, '                                                                                     + #13 +
    '  0 NUMLOTE, '                                                                                       + #13 +
    '  ' + qryPortadorforma1.fieldbyname('CODPORTFORMA').asString            + ' AS CODPORTFORMA, '       + #13 +
    '  ' + qryPortadorforma1.fieldbyname('CODPORTFORMA').asString            + ' AS CODPORTADOR, '        + #13 +
    '  ' + qryPortadorForma1.FieldByName('CODFORMAPAGTO').asString           + ' AS CODFORMAPAGTO, '      + #13 +
    '  ' + qryPortadorForma1.FieldByName('CODTIPOPAGTO').asString            + ' AS CODTIPOPAGTO, '       + #13 +
    '  ' + qryPortadorForma1.FieldByName('FLGEMITEAVISO').asString           + ' AS FLGEMITEAVISO, '      + #13 +
    '  ' + qryPortadorForma1.FieldByName('CODARQUIVOREMESSA').asString       + ' AS CODARQUIVOREMESSA, '  + #13 +
    '  ' + qryPortadorForma1.FieldByName('IDBANCO').asString                 + ' AS IDBANCO, '            + #13 +
    '  ' + QuotedStr(qryPortadorForma1.FieldByName('NOCONTACORR').asString)  + ' AS NOCONTACORR, '        + #13 +
    '  ' + ''' '' CODBARRA, '                                                                       + #13 +
    '  ' + ''' '' CODBARRAVALOR, '                                                                  + #13 +
    '  H.IDFAVORECIDO||''-''||H.IDFAVORECIDO||''-'' AS NODOCUMENTO, '                               + #13 +
    '  ' + '''02'' AS COMPLDOCUMENTO, '                                                             + #13 +
    '  ' + '''F'' AS TIPO, '                                                                        + #13 +
    '  ' + qryPortadorForma1.FieldByName('NUMEMPRESABANCO').asString + ' AS NUMEMPRESABANCO, '      + #13 +
    '  ' + ''' '' AS DEBCRE, '                                                                      + #13 +
    '  ' + '''1'' AS TIPOCONTA, '                                                                   + #13 +
    '  PA.NOME AS NOMEAGENCIA, '                                                                    + #13 +
    '  ' + '''                         '' AS LIVRE '                                                + #13 +

    'FROM '                                                                                         + #13 +
    '  HISTRUBSAL       H,  '                                                                       + #13 +
    '  PROVDESC         PD, '                                                                       + #13 +
    '  PESSOA           PF, '                                                                       + #13 +
    '  CONTABANCARIA    CB, '                                                                       + #13 +
    '  AGENCIABANCARIA  AG, '                                                                       + #13 +
    '  BANCO            BC, '                                                                       + #13 +
    '  PESSOA           PA, '                                                                       + #13 +
    '  ELEGPATRO        E,  '                                                                       + #13 +
    '  DEPENTIT         D   '                                                                       + #13 +

    'WHERE '                                                                                        + #13;

    if Pos(',', sVersaoSel) > 0 then sSQL := sSQL +
    '      H.IDHSTFOLHABENEF  IN (' + sVersaoSel + ') '                                             + #13
    else sSQL:=sSQL +
    '      H.IDHSTFOLHABENEF  = (' + sVersaoSel + ') '                                              + #13;

    sSQL := sSQL+
    '  AND H.IDFAVORECIDO     = PF.IDPESSOA '                                                       + #13 +
    '  AND H.IDMODULO         = 18 '                                                                + #13 +
    '  AND H.IDRUBRICA        = PD.IDPROVENTO '                                                     + #13 +
    '  AND H.FLGPENSAOALIM    = 0 '                                                                 + #13 +
    '  AND H.FLGTIPODESC      IN (''C'',''Y'') '                                                    + #13 +
    '  AND PD.CODPROVDESC     IN (' + edRubrica.text + ') '                                         + #13 +
    '  AND CB.IDPESSOA        = H.IDFAVORECIDO '                                                    + #13 +
    '  AND CB.FLGCONTAPREF    = 1 '                                                                 + #13 +
    '  AND AG.IDPESSOA        = CB.IDAGENCIA '                                                      + #13 +
    '  AND AG.IDPESSOA        = PA.IDPESSOA '                                                       + #13 +
    '  AND BC.IDPESSOA        = AG.IDBANCO '                                                        + #13 +
    '  AND H.IDTITULAR        = E.IDPESSOA '                                                        + #13 +
    '  AND H.IDPATRO          = E.IDPESSJUR '                                                       + #13 +
    '  AND H.IDTITULAR        = D.IDPESSOA(+) '                                                     + #13 +
    '  AND H.IDRESPONSAVEL    = D.IDPESSOA(+) '                                                     + #13 +

    'GROUP BY '                                                                                     + #13 +
    '  H.IDFAVORECIDO, PD.FLGDESCONTO, PD.CODPROVDESC, PD.DESCRICAO, '                              + #13 +
    '  DECODE(H.FLGDESCONTO, 1, H.PLACONTAC, H.PLACONTAD), '                                        + #13 +
    '  PF.TIPO, PF.NOME, CB.CONTACORRENTE, PA.NOME, D.MATRICULA, E.MATRICULA, '                     + #13 +
    '  PF.NUMDOCUMENTO, AG.NUMAGENCIA, BC.NUMBANCO '                                                + #13;
    // ---------------------------------------------------------------------------------------------
  end
  else
  begin
    // ---------------------------------------------------------------------------------------------
    sSQL:=
    'SELECT DISTINCT '                                                                              + #13 +
    '  CONTALIQUIDO, '                                                                              + #13 +
    '  IDFAVORECIDO AS IDPESSOA, '                                                                  + #13 +
    '  NOME, '                                                                                      + #13 +
    '  NOME AS RAZAOSOCIAL, '                                                                       + #13 +
    '  NUMDOCUMENTO, '                                                                              + #13 +
    '  CONTACORRENTE, '                                                                             + #13 +
    '  NUMAGENCIA , '                                                                               + #13 +
    '  NUMBANCO AS CODBANCOFAVORECIDO, '                                                            + #13 +
    '  '' '' LOGRADOURO, '                                                                          + #13 +
    '  '' '' NUMERO, '                                                                              + #13 +
    '  '' '' COMPLEMENTO, '                                                                         + #13 +
    '  '' '' BAIRRO, '                                                                              + #13 +
    '  '' '' CIDADE, '                                                                              + #13 +
    '  '' '' CODESTADO, '                                                                           + #13 +
    '  '' '' CEP, '                                                                                 + #13 +
    '  IDFAVORECIDO AS IDFORCLI, '                                                                  + #13 +
    '  IDFAVORECIDO AS CODDOCUMENTO, '                                                              + #13 +
    '  VALOR, '                                                                                     + #13 +
    '  0.00 VALORDESCONTO, '                                                                        + #13 +
    '  0.00 VALORJUROS, '                                                                           + #13 +
    '  ' + QuotedStr(formatdatetime('DD/MM/YYYY', edDataFolha.date)) + ' DATAVENCTO, '              + #13 +
    '  ' + QuotedStr(formatdatetime('DD/MM/YYYY', edDataFolha.date)) + ' DATAPROGRAMADA, '          + #13 +
    '  0 TIPOMOEDA, '                                                                               + #13 +
    '  0 NUMLOTE, '                                                                                 + #13 +
    '  CODPORTFORMA, '                                                                              + #13 +
    '  CODPORTFORMA AS CODPORTADOR, '                                                               + #13 +
    '  CODFORMAPAGTO, '                                                                             + #13 +
    '  CODTIPOPAGTO, '                                                                              + #13 +
    '  FLGEMITEAVISO, '                                                                             + #13 +
    '  CODARQUIVOREMESSA, '                                                                         + #13 +
    '  IDBANCO, '                                                                                   + #13 +
    '  NOCONTACORR, '                                                                               + #13 +
    '  ' + ''' '' CODBARRA, '                                                                       + #13 +
    '  ' + ''' '' CODBARRAVALOR, '                                                                  + #13 +
    '  IDFAVORECIDO||''-''||IDFAVORECIDO||''-'' AS NODOCUMENTO, '                                   + #13 +
    '  ' + '''02'' AS COMPLDOCUMENTO, '                                                             + #13 +
    '  ' + '''F'' AS TIPO, '                                                                        + #13 +
    '  NUMEMPRESABANCO, '                                                                           + #13 +
    '  ' + ''' '' AS DEBCRE, '                                                                      + #13 +
    '  ' + '''1'' AS TIPOCONTA, '                                                                   + #13 +
    '  NOMEAGENCIA, '                                                                               + #13 +
    '  ' + '''                         '' AS LIVRE '                                                + #13 +

    'FROM '                                                                                         + #13 +
    '  ( '                                                                                          + #13 +
    '  SELECT '                                                                                     + #13 +
    '    LD.CODPORTFORMAFAV AS CODPORTFORMA, '                                                      + #13 +
    '    DECODE(H.FLGDESCONTO,1,H.PLACONTAC,H.PLACONTAD) AS CONTALIQUIDO, '                         + #13 +
    '    LD.FLGGERACPAGAR AS FLGGERACAP, '                                                          + #13 +
    '    LD.FLGELETRONICO, '                                                                        + #13 +
    '    PF.NOME, '                                                                                 + #13 +
    '    H.IDFAVORECIDO, '                                                                          + #13 +
    '    CB.CONTACORRENTE, '                                                                        + #13 +
    '    AG.NUMAGENCIA, '                                                                           + #13 +
    '    BC.NUMBANCO, '                                                                             + #13 +
    '    PF.NUMDOCUMENTO, '                                                                         + #13 +
    '    PFR.CODARQUIVOREMESSA, '                                                                   + #13 +
    '    PFR.PATHARQUIVOREM, '                                                                      + #13 +
    '    PFR.DMAIS, '                                                                               + #13 +
    '    PFR.CONTROLEREMESSA, '                                                                     + #13 +
    '    PFR.CODFORMAPAGTO, '                                                                       + #13 +
    '    PFR.FLGEMITEAVISO, '                                                                       + #13 +
    '    PFR.CODTIPOPAGTO, '                                                                        + #13 +
    '    PFR.NUMEMPRESABANCO, '                                                                     + #13 +
    '    PCT.IDBANCO, '                                                                             + #13 +
    '    PCT.NOCONTACORR, '                                                                         + #13 +
    '    PA.NOME AS NOMEAGENCIA, '                                                                  + #13 +
    '    SUM(DECODE(H.FLGDESCONTO, 1, H.VALORPROVENTO, 0 - H.VALORPROVENTO)) AS VALOR '             + #13 +

    '  FROM '                                                                                       + #13 +
    '    HISTRUBSAL             H,   '                                                              + #13 +
    '    PROVDESC               PD,  '                                                              + #13 +
    '    PESSOA                 PF,  '                                                              + #13 +
    '    RUBRICAXCONTABANCARIA  RXB, '                                                              + #13 +
    '    CONTABANCARIA          CB,  '                                                              + #13 +
    '    AGENCIABANCARIA        AG,  '                                                              + #13 +
    '    BANCO                  BC,  '                                                              + #13 +
    '    PORTADORFORMA          PFR, '                                                              + #13 +
    '    PORTADORCONTA          PCT, '                                                              + #13 +
    '    PESSOA                 PA,  '                                                              + #13 +

    '    ( '                                                                                        + #13 +
    '    SELECT '                                                                                   + #13 +
    '      MIN(IDLAYOUT) IDLAYOUT, IDFAVORECIDO '                                                   + #13 +
    '    FROM '                                                                                     + #13 +
    '      LAYOUTXCOLUNAS '                                                                         + #13 +
    '    GROUP BY '                                                                                 + #13 +
    '      IDFAVORECIDO '                                                                           + #13 +
    '    ) LC, '                                                                                    + #13 +

    '    LAYOUTDESCONTO         LD '                                                                + #13 +

    '  WHERE '                                                                                      + #13;

    if Pos(',', sVersaoSel) > 0 then sSQL := sSQL +
    '        H.IDHSTFOLHABENEF    IN (' + sVersaoSel + ') '                                         + #13
    else sSQL:=sSQL +
    '        H.IDHSTFOLHABENEF    = (' + sVersaoSel + ') '                                          + #13 ;

    sSQL := sSQL+
    '    AND H.IDFAVORECIDO       = PF.IDPESSOA '                                                   + #13 +
    '    AND H.IDMODULO           = 18 '                                                            + #13 +
    '    AND H.IDRUBRICA          = PD.IDPROVENTO '                                                 + #13 +
    '    AND H.FLGDESCONTO        IN (0,1) '                                                        + #13 +
    '    AND H.FLGESPECIAL        = 0 '                                                             + #13 +
    '    AND H.FLGPENSAOALIM      = 0 '                                                             + #13 +
    '    AND H.FLGTIPODESC        IN (''C'',''Y'') '                                                + #13 +
    '    AND PFR.RECPAG           = ''P'' '                                                         + #13 +
    '    AND PCT.CODPORTADOR      = PFR.CODPORTADOR '                                               + #13 +
    '    AND PFR.CODPORTFORMA     = LD.CODPORTFORMAFAV '                                            + #13 +
    '    AND NVL(PF.TIPO, ''F'')  = ''J'' '                                                         + #13 +
    '    AND RXB.IDPESSOA(+)      = H.IDFAVORECIDO '                                                + #13 +
    '    AND RXB.IDRUBRICA(+)     = H.IDRUBRICA '                                                   + #13 +
    '    AND CB.IDCBANCARIA(+)    = RXB.IDCBANCARIA '                                               + #13 +
    '    AND CB.IDPESSOA(+)       = RXB.IDPESSOA '                                                  + #13 +
    '    AND AG.IDPESSOA(+)       = CB.IDAGENCIA '                                                  + #13 +
    '    AND AG.IDPESSOA          = PA.IDPESSOA(+) '                                                + #13 +
    '    AND BC.IDPESSOA(+)       = AG.IDBANCO '                                                    + #13 +
    '    AND LC.IDFAVORECIDO(+)   = H.IDFAVORECIDO '                                                + #13 +
    '    AND LD.IDLAYOUT(+)       = LC.IDLAYOUT '                                                   + #13 +
    '    AND LD.FLGGERACPAGAR(+)  = 1 '                                                             + #13 +

    '  GROUP BY '                                                                                   + #13 +  
    '    H.IDFAVORECIDO, PF.NOME, CB.CONTACORRENTE, AG.NUMAGENCIA, '                                + #13 +
    '    DECODE(H.FLGDESCONTO, 1, H.PLACONTAC, H.PLACONTAD), '                                      + #13 +
    '    PF.NUMDOCUMENTO, PFR.CODARQUIVOREMESSA, PFR.PATHARQUIVOREM, '                              + #13 +
    '    PFR.DMAIS, PFR.CONTROLEREMESSA, PFR.CODFORMAPAGTO, '                                       + #13 +
    '    PFR.FLGEMITEAVISO, PFR.CODTIPOPAGTO, PFR.NUMEMPRESABANCO, '                                + #13 +
    '    PCT.IDBANCO, PCT.NOCONTACORR, PA.NOME, '                                                   + #13 +
    '    BC.NUMBANCO, LD.CODPORTFORMAFAV, LD.FLGGERACPAGAR, LD.FLGELETRONICO '                      + #13 +
    '  ) '                                                                                          + #13 +    

    'WHERE '                                                                                        + #13 +
    '      FLGELETRONICO  = 1 '                                                                     + #13 +
    '  AND FLGGERACAP     = 1 '                                                                     + #13 +
    '  AND CONTACORRENTE  IS NOT NULL '                                                             + #13 +
    '  AND NUMAGENCIA     IS NOT NULL '                                                             + #13 +
    '  AND NUMBANCO       IS NOT NULL '                                                             + #13 +
    '  AND VALOR          > 0 '                                                                     + #13 +

    'ORDER BY '                                                                                     + #13 +
    '  NOME '                                                                                       + #13;
  end;

  if sSQL <> '' then
  begin
    cmSQLRegistro.SQL.Clear;
    cmSQLRegistro.SQL.Add(sSQL);
    cmSQLRegistro.Open;

    lblTotalArquivo.Caption := 'Valor total: ' + FormatFloat('#0.00', ObtemValor(cdsRegistro, 'valor'));
    sListaFav               := '';

    cdsRegistro.DisableControls;
    cdsRegistro.First;

    while not(cdsRegistro.EOF) do
    begin
      sListaFav := sListaFav + cdsRegistro.fieldbyname('idpessoa').asString + ',';
      cdsRegistro.next;
    end;

    cdsRegistro.EnableControls;
    delete(sListaFav, length(sListaFav), 1);
  end;

  if (rgTipo.itemindex = 1) and (cboxGeraDoc.checked) then
  begin
    sSQL:=
    'SELECT '                                                                                       + #13 +
    '  IDPLANOCONTABIL, IDPATRO, CODTIPRECDESFAV, '                                                 + #13 +
    '  PLACONTA, UNIDNEGOC, CODCENTRORESPON, '                                                      + #13 +
    '  SUM(VALOR) AS VALOR '                                                                        + #13 +

    'FROM '                                                                                         + #13 +
    '  ( '                                                                                          + #13 +
    '  SELECT '                                                                                     + #13 +
    '    H.IDPLANOCONTABIL, '                                                                       + #13 +
    '    H.IDPATRO, '                                                                               + #13 +
    '    NVL(RP.CODTIPRECDESFAV, H.CODTIPRECDES) AS CODTIPRECDESFAV, '                              + #13 +
    '    DECODE(H.FLGDESCONTO, 1, H.PLACONTAC, H.PLACONTAD) AS PLACONTA, '                          + #13 +
    '    RP.UNIDNEGOC, '                                                                            + #13 +
    '    RP.CODCENTRORESPON, '                                                                      + #13 +
    '    SUM(DECODE(PD.FLGDESCONTO, 1, H.VALORPROVENTO, 0 - H.VALORPROVENTO)) AS VALOR '            + #13 +

    '  FROM '                                                                                       + #13 +
    '    HISTRUBSAL     H,  '                                                                       + #13 +
    '    PROVDESC       PD, '                                                                       + #13 +
    '    RUBRICAXPLANO  RP, '                                                                       + #13 +
    '    PESSOA         PF  '                                                                       + #13;

    if Pos(',', sVersaoSel) > 0 then sSQL := sSQL+
    '  WHERE '                                                                                      + #13 +
    '        H.IDHSTFOLHABENEF  IN (' + sVersaoSel + ') '                                           + #13
    else sSQL := sSQL +
    '  WHERE '                                                                                      + #13 +
    '        H.IDHSTFOLHABENEF  = (' + sVersaoSel + ') '                                            + #13;

    sSQL := sSQL+
    '    AND H.IDFAVORECIDO     = PF.IDPESSOA '                                                     + #13 +
    '    AND H.IDFAVORECIDO     IN (' + sListaFav + ') '                                            + #13 +
    '    AND H.IDMODULO         = 18 '                                                              + #13 +
    '    AND H.FLGDESCONTO      IN (0, 1) '                                                         + #13 +
    '    AND H.FLGESPECIAL      = 0 '                                                               + #13 +
    '    AND H.IDRUBRICA        = PD.IDPROVENTO '                                                   + #13 +
    '    AND H.IDRUBRICA        = RP.IDRUBRICA '                                                    + #13 +
    '    AND H.IDPLANOPREV      = RP.IDPLANOPREV '                                                  + #13 +
    '    AND H.IDPATRO          = RP.IDPESSJUR '                                                    + #13 +
    '    AND H.FLGPENSAOALIM    = 0 '                                                               + #13 +
    '    AND H.FLGTIPODESC      IN (''C'', ''Y'') '                                                 + #13 +
    '    AND NVL(PF.TIPO,''F'') = ''J'' '                                                           + #13 +

    '    AND EXISTS ( '                                                                             + #13 +
    '               SELECT 1 '                                                                      + #13 +
    '               FROM '                                                                          + #13 +
    '                 LAYOUTXCOLUNAS LC, '                                                          + #13 +
    '                 LAYOUTDESCONTO LD  '                                                          + #13 +
    '               WHERE '                                                                         + #13 +
    '                     LC.IDFAVORECIDO   = H.IDFAVORECIDO '                                      + #13 +
    '                 AND LD.IDLAYOUT       = LC.IDLAYOUT '                                         + #13 +
    '                 AND LD.FLGGERACPAGAR  = 1 '                                                   + #13 +
    '                 AND LD.FLGELETRONICO  = 1 '                                                   + #13 +
    '               ) '                                                                             + #13 +

    '  GROUP BY '                                                                                   + #13 +
    '    H.IDPLANOCONTABIL, H.IDPATRO, NVL(RP.CODTIPRECDESFAV,H.CODTIPRECDES), '                    + #13 +
    '    PD.FLGDESCONTO, DECODE(H.FLGDESCONTO, 1, H.PLACONTAC, H.PLACONTAD), '                      + #13 +
    '    RP.UNIDNEGOC, RP.CODCENTRORESPON '                                                         + #13 +
    '  ) '                                                                                          + #13 +
    'GROUP BY '                                                                                     + #13 +
    '  IDPLANOCONTABIL, IDPATRO, CODTIPRECDESFAV, PLACONTA, UNIDNEGOC, CODCENTRORESPON '            + #13;

    if sSQL <> '' then
    begin
      if FazQuery(qryRateioComArq, sSQL) then
      begin
        lblTotalDocComArq.Caption := 'Valor total: ' + FormatFloat('#0.00', ObtemValor(qryRateioComArq, 'valor'));
      end;
    end;

    sSQL:=
    'SELECT '                                                                                       + #13 +
    '  IDPLANOCONTABIL, IDPATRO, IDFAVORECIDO, NOME, CODTIPRECDESFAV, '                             + #13 +
    '  PLACONTA, UNIDNEGOC, CODCENTRORESPON, CODPORTFORMA, SUM(VALOR) AS VALOR '                    + #13 +
    'FROM '                                                                                         + #13 +
    '  ( '                                                                                          + #13 +
    '  SELECT '                                                                                     + #13 +
    '    H.IDPLANOCONTABIL, H.IDPATRO, H.IDFAVORECIDO, PF.NOME, '                                   + #13 +
    '    NVL(RP.CODTIPRECDESFAV, H.CODTIPRECDES) AS CODTIPRECDESFAV, '                              + #13 +
    '    DECODE(H.FLGDESCONTO, 1, H.PLACONTAC, H.PLACONTAD) AS PLACONTA, '                          + #13 +
    '    RP.UNIDNEGOC, RP.CODCENTRORESPON, LD.CODPORTFORMAFAV AS CODPORTFORMA, '                    + #13 +
    '    SUM(DECODE(PD.FLGDESCONTO, 1, H.VALORPROVENTO, 0 - H.VALORPROVENTO)) AS VALOR '            + #13 +
    '  FROM '                                                                                       + #13 +
    '    HISTRUBSAL     H,  '                                                                       + #13 +
    '    PROVDESC       PD, '                                                                       + #13 +
    '    RUBRICAXPLANO  RP, '                                                                       + #13 +
    '    PESSOA         PF, '                                                                       + #13 +

    '    ( '                                                                                        + #13 +
    '    SELECT '                                                                                   + #13 +
    '      MIN(LC.IDLAYOUT) AS IDLAYOUT, LC.IDFAVORECIDO '                                          + #13 +
    '    FROM '                                                                                     + #13 +
    '      LAYOUTXCOLUNAS LC '                                                                      + #13 +
    '      GROUP BY LC.IDFAVORECIDO '                                                               + #13 +
    '    ) LXC, '                                                                                   + #13 +

    '    LAYOUTDESCONTO LD  '                                                                       + #13 +

    '  WHERE '                                                                                      + #13;

    if Pos(',', sVersaoSel) > 0 then sSQL := sSQL+
    '        H.IDHSTFOLHABENEF        IN (' + sVersaoSel + ') '                                     + #13
    else sSQL := sSQL+
    '        H.IDHSTFOLHABENEF        = (' + sVersaoSel + ') '                                      + #13;

    sSQL := sSQL+
    '    AND H.IDFAVORECIDO           = PF.IDPESSOA '                                               + #13 +
    '    AND H.IDMODULO               = 18 '                                                        + #13 +
    '    AND H.IDRUBRICA              = PD.IDPROVENTO '                                             + #13 +
    '    AND H.IDRUBRICA              = RP.IDRUBRICA '                                              + #13 +
    '    AND H.IDPLANOPREV            = RP.IDPLANOPREV '                                            + #13 +

    '    AND H.FLGDESCONTO            IN (0, 1) '                                                   + #13 +
    '    AND H.FLGESPECIAL            = 0 '                                                         + #13 +

    '    AND H.IDPATRO                = RP.IDPESSJUR '                                              + #13 +
    '    AND H.FLGPENSAOALIM          = 0 '                                                         + #13 +
    '    AND H.FLGTIPODESC            IN (''C'',''Y'') '                                            + #13 +
    '    AND NVL(PF.TIPO, ''F'')      = ''J'' '                                                     + #13 +
    '    AND LXC.IDFAVORECIDO         = H.IDFAVORECIDO '                                            + #13 +
    '    AND LXC.IDLAYOUT             = LD.IDLAYOUT '                                               + #13 +
    '    AND NVL(LD.FLGGERACPAGAR, 0) = 1 '                                                         + #13 +
    '    AND NVL(LD.FLGELETRONICO, 0) = 0 '                                                         + #13 +
    '    AND EXISTS ( '                                                                             + #13 +
    '               SELECT 1 '                                                                      + #13 +
    '               FROM '                                                                          + #13 +
    '                 LAYOUTXCOLUNAS LC, '                                                          + #13 +
    '                 LAYOUTDESCONTO LD  '                                                          + #13 +
    '               WHERE '                                                                         + #13 +
    '                     LC.IDFAVORECIDO           = H.IDFAVORECIDO '                              + #13 +
    '                 AND LD.IDLAYOUT               = LC.IDLAYOUT '                                 + #13 +
    '                 AND LD.FLGGERACPAGAR          = 1 '                                           + #13 +
    '                 AND NVL(LD.FLGELETRONICO, 0)  = 0 '                                           + #13 +
    '               ) '                                                                             + #13 +
    '  GROUP BY '                                                                                   + #13 +
    '    H.IDPLANOCONTABIL, H.IDPATRO, PD.FLGDESCONTO, NVL(RP.CODTIPRECDESFAV, H.CODTIPRECDES), '   + #13 +
    '    DECODE(H.FLGDESCONTO, 1, H.PLACONTAC, H.PLACONTAD), H.IDFAVORECIDO, PF.NOME, '             + #13 +
    '    RP.UNIDNEGOC, RP.CODCENTRORESPON, LD.CODPORTFORMAFAV '                                     + #13 +
    '  ) '                                                                                          + #13 +

    'GROUP BY '                                                                                     + #13 + 
    '  IDPLANOCONTABIL, IDPATRO, IDFAVORECIDO, NOME, CODTIPRECDESFAV, PLACONTA, UNIDNEGOC, '        + #13 +
    '  CODCENTRORESPON, CODPORTFORMA '                                                              + #13 +

    'ORDER '                                                                                        + #13 +
    '  BY IDFAVORECIDO '                                                                            + #13;

    if sSQL <> '' then
    begin
      if FazQuery(qryRateioSemArq, sSQL) then
      begin
        lblTotalDocSemArq.Caption := 'Valor total: ' + FormatFloat('#0.00', ObtemValor(qryRateioSemArq, 'valor'));
      end;
    end;
  end;

  lbProcessando.Visible := False;
end;



procedure TfrmGeraArquivoConsignatario.btnBuscaClick(Sender: TObject);
begin
  inherited;
  AbreMontaQuery;
end;



procedure TfrmGeraArquivoConsignatario.MsgErro(sMsg: String);
begin
  ShowMessage(sMsg);
end;



end.
