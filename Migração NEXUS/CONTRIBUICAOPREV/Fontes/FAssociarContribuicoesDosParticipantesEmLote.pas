{-------------------------------------------------------------------------------
CRIAÇÃO
--------------------------------------------------------------------------------
Pendência   : SIG 101465
Responsável : Ewerton Beltramini
Data        : 19/08/2021
Descrição   : Criação de form para Atualização / Inclusão de dados para Associar
              Contribuições dos Participantes em Lote
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
ALTERAÇÕES  /  IMPLEMENTAÇÕES
--------------------------------------------------------------------------------
Alteração  : btn1Click
Nº WO......: 9432
Data.......: 22/03/2024
Responsável: Andre Imakawa
Descrição..: Alteração do \\FUNCEF.COM.BR\ARQUIVOS pasta Compartilhada
--------------------------------------------------------------------------------
Alteração  : btn1Click
Nº WO......: 8381
Data.......: 28/02/2024
Responsável: Andre Imakawa
Descrição..: Alteração do ALTARF para \\FUNCEF.COM.BR\ARQUIVOS
--------------------------------------------------------------------------------}


unit FAssociarContribuicoesDosParticipantesEmLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uMensErro, dBaseDados, UDataBase,
  SdfData, Spin, ADODB, ComObj;

type
  TFrmAssociarContribuicoesDosParticipantesEmLote = class(TfrmOkCancelar)
    lbl1: TLabel;
    pnl1: TPanel;
    lbl2: TLabel;
    btn1: TSpeedButton;
    edt1: TEdit;
    btn2: TBitBtn;
    btn3: TBitBtn;
    mmoArquivo1: TMemo;
    rgRgTipoOperacao1: TRadioGroup;
    ds: TwwDataSource;
    wqryUpdate: TwwQuery;
    wqryDel: TwwQuery;
    OpenDialog: TOpenDialog;
    qry: TwwQuery;
    btn4: TSpeedButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure rgRgTipoOperacao1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bLocalizado : Boolean;
  end;

var
  FrmAssociarContribuicoesDosParticipantesEmLote: TFrmAssociarContribuicoesDosParticipantesEmLote;

implementation

uses
  FPrincipal, UAdmPrev, USistema;
{$R *.DFM}

procedure TFrmAssociarContribuicoesDosParticipantesEmLote.btn1Click(Sender: TObject);
var
  excel: variant;
begin
  inherited;
  //Abrindo o modelo salvo...
  excel := CreateOleObject('Excel.Application');
  excel.Visible := True;
  //excel.WorkBooks.Add('\\altarf\#altarf\GETIF_PUBLICO\COARI\Modelos\INSERT CONTRIBPREVPARTP.xlsx');               // Andre Imakawa - WO8381
  //excel.WorkBooks.Add('\\Funcef.com.br\arquivos\Planus\Documentos\COARI\Modelos\INSERT CONTRIBPREVPARTP.xlsx');  // Andre Imakawa - WO8381
  excel.WorkBooks.Add('\\Funcef.com.br\arquivos\PLANUS_COARI\Modelos\INSERT CONTRIBPREVPARTP.xlsx');  // Andre Imakawa - WO9432
end;

procedure TFrmAssociarContribuicoesDosParticipantesEmLote.btn2Click(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
    edt1.Text := OpenDialog.FileName;
end;

procedure TFrmAssociarContribuicoesDosParticipantesEmLote.btn3Click(Sender: TObject);
begin
  inherited;
  edt1.Clear;
  mmoArquivo1.Clear;
end;

procedure TFrmAssociarContribuicoesDosParticipantesEmLote.rgRgTipoOperacao1Click(Sender: TObject);
begin
  inherited;
  if RgrgTipoOperacao1.ItemIndex = 0 then
    bbtnConfirmar.Caption := '&Atualizar'
  else if RgrgTipoOperacao1.ItemIndex = 1 then
    bbtnConfirmar.Caption := '&Incluir';

  Application.ProcessMessages;
end;

procedure TFrmAssociarContribuicoesDosParticipantesEmLote.bbtnConfirmarClick(Sender: TObject);
var
  excel: variant;
  ilinha, icoluna, iContCampos, iIdLogTotalPREV: integer;
  bSair: boolean;

  sSqlAux, sSqlComando : String;

  //Variaveis para os novos valores importados...
  sIDPESSJUR, sIDTPPERIODICIDADE, sIDPESSOA, sIDPLANOPREV, sSEQPROPOSTA, sIDCONTRIBUICAO, sCODPORTFORMA, sFLGDESCFOLHA,
  sVALORBASE1, sFLGCOBRA, sDATAINICIO, sDATAFINAL, sIDHISTPROPOSTA, sCODPORTFORMA13, sIDPLANPREVCONTAB: string;

  //Variaveis para os valores atuais na base...
  sIDPESSJUR_antigo, sIDTPPERIODICIDADE_antigo, sIDPESSOA_antigo, sIDPLANOPREV_antigo, sSEQPROPOSTA_antigo, sIDCONTRIBUICAO_antigo,
  sCODPORTFORMA_antigo, sFLGDESCFOLHA_antigo, sVALORBASE1_antigo, sFLGCOBRA_antigo, sDATAINICIO_antigo, sDATAFINAL_antigo,
  sIDHISTPROPOSTA_antigo, sCODPORTFORMA13_antigo, sIDPLANPREVCONTAB_antigo: string;

begin
  inherited;
  if RgrgTipoOperacao1.ItemIndex = -1 then
  begin
    MsgDlg('É necessário selecionar o Tipo da Operação (Atualização/Exclusão)!', 'Contribuição-Prev', mtWarning, [mbOK], 0);
    Exit;
  end;

  if (edt1.Text = '') then
  begin
    MsgDlg('É necessário selecionar o arquivo para carregar as informações.', 'Contribuição-Prev', mtWarning, [mbOK], 0);
    Exit;
  end;

  mmoArquivo1.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------');
  mmoArquivo1.Lines.Add('Carregando os dados...');

  try

    excel := CreateOleObject('Excel.Application');
    excel.Visible := False;
    excel.WorkBooks.Add(OpenDialog.FileName);

    mmoArquivo1.Lines.Add('Lendo e processando os dados do arquivo informado...');

    StartTransacao;
    ilinha := 2;
    bSair := True;

    //if RgrgTipoOperacao1.ItemIndex = 0 then  //Atualizar
    //begin
      while bSair do
      begin
        if excel.Cells.Item[ilinha, 1].Text <> '' then
        begin
           sIDPESSJUR         :=  Trim(excel.Cells.Item[ilinha, 1].Value);
           sIDTPPERIODICIDADE :=  Trim(excel.Cells.Item[ilinha, 2].Value);
           sIDPESSOA     	    :=  Trim(excel.Cells.Item[ilinha, 3].Value);
           sIDPLANOPREV       :=  Trim(excel.Cells.Item[ilinha, 4].Value);
           sSEQPROPOSTA       :=  Trim(excel.Cells.Item[ilinha, 5].Value);
           sIDCONTRIBUICAO    :=  Trim(excel.Cells.Item[ilinha, 6].Value);
           sCODPORTFORMA      :=  Trim(excel.Cells.Item[ilinha, 7].Value);
           sFLGDESCFOLHA      :=  Trim(excel.Cells.Item[ilinha, 8].Value);
           if (StrToIntDef(Trim(excel.Cells.Item[ilinha, 9].Value), 0) <> 0) then
                sVALORBASE1        :=  StringReplace(StringReplace(FormatFloat('#.##', excel.Cells.Item[ilinha, 9].Value), '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll])
           else sVALORBASE1        :=  Trim(excel.Cells.Item[ilinha, 9].Value);
           sFLGCOBRA          :=  Trim(excel.Cells.Item[ilinha, 10].Value);
           sDATAINICIO        :=  Trim(excel.Cells.Item[ilinha, 11].Value);
           sDATAFINAL         :=  Trim(excel.Cells.Item[ilinha, 12].Value);
           sIDHISTPROPOSTA    :=  Trim(excel.Cells.Item[ilinha, 13].Value);
           sCODPORTFORMA13    :=  Trim(excel.Cells.Item[ilinha, 14].Value);
           sIDPLANPREVCONTAB  :=  Trim(excel.Cells.Item[ilinha, 15].Value);

           iContCampos := 0;

          if  Trim(sIDPESSJUR)         = '' then sIDPESSJUR          := '0'    else inc(iContCampos);
          if  Trim(sIDTPPERIODICIDADE) = '' then sIDTPPERIODICIDADE  := '0'    else inc(iContCampos);
          if  Trim(sIDPESSOA)    	     = '' then sIDPESSOA           := '0'    else inc(iContCampos);
          if  Trim(sIDPLANOPREV)       = '' then sIDPLANOPREV        := '0'    else inc(iContCampos);
          if  Trim(sSEQPROPOSTA)       = '' then sSEQPROPOSTA        := '0'    else inc(iContCampos);
          if  Trim(sIDCONTRIBUICAO)    = '' then sIDCONTRIBUICAO     := '0'    else inc(iContCampos);
          if  Trim(sCODPORTFORMA)      = '' then sCODPORTFORMA       := '0'    else inc(iContCampos);
          if  Trim(sFLGDESCFOLHA)      = '' then sFLGDESCFOLHA       := '0'    else inc(iContCampos);
          if  Trim(sVALORBASE1)        = '' then sVALORBASE1         := '0'    else inc(iContCampos);
          if  Trim(sFLGCOBRA)          = '' then sFLGCOBRA           := '0'    else inc(iContCampos);
          if  Trim(sDATAINICIO)        = '' then sDATAINICIO         := 'NULL' else inc(iContCampos);
          if  Trim(sDATAFINAL)         = '' then sDATAFINAL          := 'NULL' else inc(iContCampos);
          if  Trim(sIDHISTPROPOSTA)    = '' then sIDHISTPROPOSTA     := '0'    else inc(iContCampos);
          if  Trim(sCODPORTFORMA13)    = '' then sCODPORTFORMA13     := '0'    else inc(iContCampos);
          if  Trim(sIDPLANPREVCONTAB)  = '' then sIDPLANPREVCONTAB   := '0'    else inc(iContCampos);


          if ((sIDPESSOA <> '0') and (sIDCONTRIBUICAO <> '0') and (sIDPLANOPREV <> '0') and (sIDPESSJUR <> '0') and (sSEQPROPOSTA <> '0')) and (iContCampos > 0) then
          begin

            bLocalizado := False;
            wqryUpdate.Close;
            wqryUpdate.SQL.Clear;
            wqryUpdate.SQL.Add( ' Select IDPESSJUR, IDTPPERIODICIDADE, IDPESSOA, IDPLANOPREV, SEQPROPOSTA, IDCONTRIBUICAO, CODPORTFORMA, FLGDESCFOLHA, VALORBASE1, '
                              + ' FLGCOBRA, DATAINICIO, DATAFINAL, IDHISTPROPOSTA, CODPORTFORMA13, IDPLANPREVCONTAB '
                              + ' from cm.CONTRIBPREVPARTP  where '
                              + ' IDPESSOA =  ' + sIDPESSOA
                              + ' and IDCONTRIBUICAO =  ' + sIDCONTRIBUICAO
                              + ' and IDPLANOPREV =  ' + sIDPLANOPREV
                              + ' and SEQPROPOSTA =  ' + sSEQPROPOSTA
                              + ' and IDPESSJUR =  ' + sIDPESSJUR );
            wqryUpdate.Open;

            if not wqryUpdate.IsEmpty then
            begin
                bLocalizado := True;
                sIDPESSJUR_antigo         := wqryUpdate.FieldByName('IDPESSJUR').AsString;
                sIDTPPERIODICIDADE_antigo := wqryUpdate.FieldByName('IDTPPERIODICIDADE').AsString;
                sIDPESSOA_antigo          := wqryUpdate.FieldByName('IDPESSOA').AsString;
                sIDPLANOPREV_antigo       := wqryUpdate.FieldByName('IDPLANOPREV').AsString;
                sSEQPROPOSTA_antigo       := wqryUpdate.FieldByName('SEQPROPOSTA').AsString;
                sIDCONTRIBUICAO_antigo    := wqryUpdate.FieldByName('IDCONTRIBUICAO').AsString;
                sCODPORTFORMA_antigo      := wqryUpdate.FieldByName('CODPORTFORMA').AsString;
                sFLGDESCFOLHA_antigo      := wqryUpdate.FieldByName('FLGDESCFOLHA').AsString;
                sVALORBASE1_antigo        := wqryUpdate.FieldByName('VALORBASE1').AsString;
                sFLGCOBRA_antigo          := wqryUpdate.FieldByName('FLGCOBRA').AsString;
                sDATAINICIO_antigo        := wqryUpdate.FieldByName('DATAINICIO').AsString;
                sDATAFINAL_antigo         := wqryUpdate.FieldByName('DATAFINAL').AsString;
                sIDHISTPROPOSTA_antigo    := wqryUpdate.FieldByName('IDHISTPROPOSTA').AsString;
                sCODPORTFORMA13_antigo    := wqryUpdate.FieldByName('CODPORTFORMA13').AsString;
                sIDPLANPREVCONTAB_antigo  := wqryUpdate.FieldByName('IDPLANPREVCONTAB').AsString;
            end;
            wqryUpdate.Close;
            wqryUpdate.SQL.Clear;

            sSqlComando := '';
            sSqlAux := '';

            if (RgrgTipoOperacao1.ItemIndex = 0) and (bLocalizado = True) then
            begin
                  sSqlAux := ' update CONTRIBPREVPARTP set ';
                  sSqlAux := sSqlAux + ' IDPESSOA =  ' + sIDPESSOA
                                     + ' ,IDCONTRIBUICAO =  ' + sIDCONTRIBUICAO
                                     + ' ,IDPLANOPREV =  ' + sIDPLANOPREV
                                     + ' ,SEQPROPOSTA =  ' + sSEQPROPOSTA
                                     + ' ,IDPESSJUR =  ' + sIDPESSJUR;


                  if (sIDTPPERIODICIDADE <> '0') then
                  begin
                       if (UpperCase(sIDTPPERIODICIDADE) = 'NULO') then sIDTPPERIODICIDADE := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,IDTPPERIODICIDADE    = ' + sIDTPPERIODICIDADE;
                       sSqlComando := sSqlComando + ' IDTPPERIODICIDADE_novo=' + sIDTPPERIODICIDADE + ' IDTPPERIODICIDADE_antigo= ' + sIDTPPERIODICIDADE_antigo;
                  end;

                  if (sCODPORTFORMA <> '0') then
                  begin
                       if (UpperCase(sCODPORTFORMA) = 'NULO') then sCODPORTFORMA := '0';  //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,CODPORTFORMA    = ' + sCODPORTFORMA;
                       sSqlComando := sSqlComando + ' CODPORTFORMA_novo=' + sCODPORTFORMA + ' CODPORTFORMA_antigo= ' + sCODPORTFORMA_antigo;
                  end;

                  if (sFLGDESCFOLHA <> '0') then
                  begin
                       if (UpperCase(sFLGDESCFOLHA) = 'NULO') then sFLGDESCFOLHA := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,FLGDESCFOLHA    = ' + sFLGDESCFOLHA;
                       sSqlComando := sSqlComando + ' FLGDESCFOLHA_novo=' + sFLGDESCFOLHA + ' FLGDESCFOLHA_antigo= ' + sFLGDESCFOLHA_antigo;
                  end;

                  if (sVALORBASE1 <> '0') then
                  begin
                       if (UpperCase(sVALORBASE1) = 'NULO') then sVALORBASE1 := '0';  //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,VALORBASE1    = ' + sVALORBASE1;
                       sSqlComando := sSqlComando + ' VALORBASE1_novo=' + sVALORBASE1 + ' VALORBASE1_antigo= ' + sVALORBASE1_antigo;
                  end;

                  if (sFLGCOBRA <> '0') then
                  begin
                       if (UpperCase(sFLGCOBRA) = 'NULO') then sFLGCOBRA := '0';  //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,FLGCOBRA    = ' + sFLGCOBRA;
                       sSqlComando := sSqlComando + ' FLGCOBRA_novo=' + sFLGCOBRA + ' FLGCOBRA_antigo= ' + sFLGCOBRA_antigo;
                  end;

                  if (sDATAINICIO <> 'NULL') then
                  begin
                       if (UpperCase(sDATAINICIO) = 'NULO') then sDATAINICIO := 'NULL';  //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,DATAINICIO    = ' + QuotedStr(sDATAINICIO);
                       sSqlComando := sSqlComando + ' DATAINICIO_novo=' + sDATAINICIO + ' DATAINICIO_antigo= ' + sDATAINICIO_antigo;
                  end;

                  if (sDATAFINAL <> 'NULL') then
                  begin
                       if (UpperCase(sDATAFINAL) = 'NULO') then sDATAFINAL := 'NULL';   //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,DATAFINAL    = ' + QuotedStr(sDATAFINAL);
                       sSqlComando := sSqlComando + ' DATAFINAL_novo=' + sDATAFINAL + ' DATAFINAL_antigo= ' + sDATAFINAL_antigo;
                  end;

                  if (sIDHISTPROPOSTA <> '0') then
                  begin
                       if (UpperCase(sIDHISTPROPOSTA) = 'NULO') then sIDHISTPROPOSTA := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,IDHISTPROPOSTA    = ' + sIDHISTPROPOSTA;
                       sSqlComando := sSqlComando + ' IDHISTPROPOSTA_novo=' + sIDHISTPROPOSTA + ' IDHISTPROPOSTA_antigo= ' + sIDHISTPROPOSTA_antigo;
                  end;

                  if (sCODPORTFORMA13 <> '0') then
                  begin
                       if (UpperCase(sCODPORTFORMA13) = 'NULO') then sCODPORTFORMA13 := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,CODPORTFORMA13    = ' + sCODPORTFORMA13;
                       sSqlComando := sSqlComando + ' CODPORTFORMA13_novo=' + sCODPORTFORMA13 + ' CODPORTFORMA13_antigo= ' + sCODPORTFORMA13_antigo;
                  end;

                  if (sIDPLANPREVCONTAB <> '0') then
                  begin
                       if (UpperCase(sIDPLANPREVCONTAB) = 'NULO') then sIDPLANPREVCONTAB := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,IDPLANPREVCONTAB    = ' + sIDPLANPREVCONTAB;
                       sSqlComando := sSqlComando + ' IDPLANPREVCONTAB_novo=' + sIDPLANPREVCONTAB + ' IDPLANPREVCONTAB_antigo= ' + sIDPLANPREVCONTAB_antigo;
                  end;

                  sSqlAux := sSqlAux + ' where IDPESSOA =  ' + sIDPESSOA
                                     + '   and IDCONTRIBUICAO =  ' + sIDCONTRIBUICAO
                                     + '   and IDPLANOPREV =  ' + sIDPLANOPREV
                                     + '   and SEQPROPOSTA  =  ' + sSEQPROPOSTA
                                     + '   and IDPESSJUR =  ' + sIDPESSJUR;

            end
            else if (RgrgTipoOperacao1.ItemIndex = 1) and (bLocalizado = False) then
            begin

                  sSqlAux := ' insert into CONTRIBPREVPARTP ( IDPESSOA, IDCONTRIBUICAO, IDPLANOPREV, IDPESSJUR, SEQPROPOSTA ';

                  if (sIDTPPERIODICIDADE <> '0')    or (sIDTPPERIODICIDADE = 'NULO') then sSqlAux := sSqlAux + ', IDTPPERIODICIDADE';
                  if (sCODPORTFORMA      <> '0')    or (sCODPORTFORMA      = 'NULO') then sSqlAux := sSqlAux + ', CODPORTFORMA'     ;
                  if (sFLGDESCFOLHA      <> '0')    or (sFLGDESCFOLHA      = 'NULO') then sSqlAux := sSqlAux + ', FLGDESCFOLHA'     ;
                  if (sVALORBASE1        <> '0')    or (sVALORBASE1        = 'NULO') then sSqlAux := sSqlAux + ', VALORBASE1'       ;
                  if (sFLGCOBRA          <> '0')    or (sFLGCOBRA          = 'NULO') then sSqlAux := sSqlAux + ', FLGCOBRA'         ;
                  if (sDATAINICIO        <> 'NULL') or (sDATAINICIO        = 'NULO') then sSqlAux := sSqlAux + ', DATAINICIO'       ;
                  if (sDATAFINAL         <> 'NULL') or (sDATAFINAL         = 'NULO') then sSqlAux := sSqlAux + ', DATAFINAL'        ;
                  if (sIDHISTPROPOSTA    <> '0')    or (sIDHISTPROPOSTA    = 'NULO') then sSqlAux := sSqlAux + ', IDHISTPROPOSTA'   ;
                  if (sCODPORTFORMA13    <> '0')    or (sCODPORTFORMA13    = 'NULO') then sSqlAux := sSqlAux + ', CODPORTFORMA13'   ;
                  if (sIDPLANPREVCONTAB  <> '0')    or (sIDPLANPREVCONTAB  = 'NULO') then sSqlAux := sSqlAux + ', IDPLANPREVCONTAB' ;

                  sSqlAux := sSqlAux + ' ) values ( ';

                  sSqlAux := sSqlAux + sIDPESSOA + ', ' + sIDCONTRIBUICAO + ', ' + sIDPLANOPREV + ', ' + sIDPESSJUR + ', ' + sSEQPROPOSTA;


                  if (sIDTPPERIODICIDADE <> '0') then
                  begin
                       if (UpperCase(sIDTPPERIODICIDADE) = 'NULO') then sIDTPPERIODICIDADE := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,' + sIDTPPERIODICIDADE;
                       sSqlComando := sSqlComando + ' IDTPPERIODICIDADE_novo=' + sIDTPPERIODICIDADE + ' IDTPPERIODICIDADE_antigo= ' + sIDTPPERIODICIDADE_antigo;
                  end;

                  if (sCODPORTFORMA <> '0') then
                  begin
                       if (UpperCase(sCODPORTFORMA) = 'NULO') then sCODPORTFORMA := '0';  //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,' + sCODPORTFORMA;
                       sSqlComando := sSqlComando + ' CODPORTFORMA_novo=' + sCODPORTFORMA + ' CODPORTFORMA_antigo= ' + sCODPORTFORMA_antigo;
                  end;

                  if (sFLGDESCFOLHA <> '0') then
                  begin
                       if (UpperCase(sFLGDESCFOLHA) = 'NULO') then sFLGDESCFOLHA := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,' + sFLGDESCFOLHA;
                       sSqlComando := sSqlComando + ' FLGDESCFOLHA_novo=' + sFLGDESCFOLHA + ' FLGDESCFOLHA_antigo= ' + sFLGDESCFOLHA_antigo;
                  end;

                  if (sVALORBASE1 <> '0') then
                  begin
                       if (UpperCase(sVALORBASE1) = 'NULO') then sVALORBASE1 := '0';  //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,' + sVALORBASE1;
                       sSqlComando := sSqlComando + ' VALORBASE1_novo=' + sVALORBASE1 + ' VALORBASE1_antigo= ' + sVALORBASE1_antigo;
                  end;

                  if (sFLGCOBRA <> '0') then
                  begin
                       if (UpperCase(sFLGCOBRA) = 'NULO') then sFLGCOBRA := '0';  //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,' + sFLGCOBRA;
                       sSqlComando := sSqlComando + ' FLGCOBRA_novo=' + sFLGCOBRA + ' FLGCOBRA_antigo= ' + sFLGCOBRA_antigo;
                  end;

                  if (sDATAINICIO <> 'NULL') then
                  begin
                       if (UpperCase(sDATAINICIO) = 'NULO') then sDATAINICIO := 'NULL';  //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,' + QuotedStr(sDATAINICIO);
                       sSqlComando := sSqlComando + ' DATAINICIO_novo=' + sDATAINICIO + ' DATAINICIO_antigo= ' + sDATAINICIO_antigo;
                  end;

                  if (sDATAFINAL <> 'NULL') then
                  begin
                       if (UpperCase(sDATAFINAL) = 'NULO') then sDATAFINAL := 'NULL';   //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,' + QuotedStr(sDATAFINAL);
                       sSqlComando := sSqlComando + ' DATAFINAL_novo=' + sDATAFINAL + ' DATAFINAL_antigo= ' + sDATAFINAL_antigo;
                  end;

                  if (sIDHISTPROPOSTA <> '0') then
                  begin
                       if (UpperCase(sIDHISTPROPOSTA) = 'NULO') then sIDHISTPROPOSTA := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,' + sIDHISTPROPOSTA;
                       sSqlComando := sSqlComando + ' IDHISTPROPOSTA_novo=' + sIDHISTPROPOSTA + ' IDHISTPROPOSTA_antigo= ' + sIDHISTPROPOSTA_antigo;
                  end;

                  if (sCODPORTFORMA13 <> '0') then
                  begin
                       if (UpperCase(sCODPORTFORMA13) = 'NULO') then sCODPORTFORMA13 := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,' + sCODPORTFORMA13;
                       sSqlComando := sSqlComando + ' CODPORTFORMA13_novo=' + sCODPORTFORMA13 + ' CODPORTFORMA13_antigo= ' + sCODPORTFORMA13_antigo;
                  end;

                  if (sIDPLANPREVCONTAB <> '0') then
                  begin
                       if (UpperCase(sIDPLANPREVCONTAB) = 'NULO') then sIDPLANPREVCONTAB := '0'; //Caso o campo seja preenchido com a palavra " NULO "  limpa o campo
                       sSqlAux := sSqlAux + ' ,' + sIDPLANPREVCONTAB;
                       sSqlComando := sSqlComando + ' IDPLANPREVCONTAB_novo=' + sIDPLANPREVCONTAB + ' IDPLANPREVCONTAB_antigo= ' + sIDPLANPREVCONTAB_antigo;
                  end;

                  sSqlAux := sSqlAux + ')';
            end
            else
            begin

                  if (RgrgTipoOperacao1.ItemIndex = 0) and (bLocalizado = False) then
                  mmoArquivo1.Lines.Add('--> Registro não localizado para Atualização: (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                                                   + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                                                   + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                                                   + ' (' + Trim(excel.Cells.Item[ilinha, 5].text) + ')'
                                                                                   + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')');

                  if (RgrgTipoOperacao1.ItemIndex = 1) and (bLocalizado = True) then
                  mmoArquivo1.Lines.Add('--> O Registro já existe: (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 5].text) + ')'
                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')');
            end;


            if sSqlAux <> '' then
            try
              wqryUpdate.SQL.Text := sSqlAux;
              wqryUpdate.ExecSql;
              if wqryUpdate.RowsAffected > 0 then
              begin

                mmoArquivo1.Lines.Add('--> Registro alterado/inserido com sucesso: (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 5].text) + ')'
                                                                               + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')' );

                sSqlComando := 'Alt.Hist.Reser.lote: ' + sSqlComando;

                wqryUpdate.Close;
                iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');
                wqryUpdate.SQL.Text := 'INSERT INTO LOGTOTALPREV ' + #13 + '( ' + #13 + 'IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDPESQUISA1, IDUSUARIO, DATA ' + #13 + ') ' + #13
                                     + 'VALUES ' + #13 + '(' + IntToStr(iIdLogTotalPREV) + ', ' + IntToStr(Sistema.IdModulo) + ', ' + '''' + sSqlComando + ''', '
                                     + sIDPESSOA + '-' + sIDCONTRIBUICAO + '-' + sIDPLANOPREV + '-' + sIDPESSJUR + '-' + sSEQPROPOSTA + ', ' + IntToStr(Sistema.IdUsuario) + ', ' + ' SYSDATE ' + #13 + ') ';
                wqryUpdate.ExecSql;

              end
              else
                mmoArquivo1.Lines.Add('--> Registro não localizado: ' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                                      + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                                      + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                                      + ' (' + Trim(excel.Cells.Item[ilinha, 5].text) + ')'
                                                                      + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')');
            except
              on E: Exception do
              begin
                mmoArquivo1.Lines.Add('--> Erro ao alterar/incluir o registro: (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                                        + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                                        + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                                        + ' (' + Trim(excel.Cells.Item[ilinha, 5].text) + ')'
                                                                        + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')'
                                                                        + 'Erro: ' + E.Message);
              end;
            end;
          end
          else
          begin
                mmoArquivo1.Lines.Add('--> Não é possível realizar a alteração/inclusão:' + #13 + 'Erro no preenchimento das colunas obrigatórias.' + #13 
                                                                                          + ' (' + Trim(excel.Cells.Item[ilinha, 1].text) + ')'
                                                                                          + ' (' + Trim(excel.Cells.Item[ilinha, 3].text) + ')'
                                                                                          + ' (' + Trim(excel.Cells.Item[ilinha, 4].text) + ')'
                                                                                          + ' (' + Trim(excel.Cells.Item[ilinha, 5].text) + ')'
                                                                                          + ' (' + Trim(excel.Cells.Item[ilinha, 6].text) + ')' );

          end;

          ilinha := ilinha + 1;

        end
        else
            bSair := False;
      end;
    //end
    (*
    else if RgrgTipoOperacao1.ItemIndex = 1 then
    begin
      while bSair do
      begin
        if excel.Cells.Item[ilinha, 1].Text <> '' then
        begin

          //Tratando os valores vindos do excel...
          sIDPESSJUR       :=  Trim(excel.Cells.Item[ilinha, 1].Value);
          sIDPESSOA     	 :=  Trim(excel.Cells.Item[ilinha, 3].Value);
          sIDPLANOPREV     :=  Trim(excel.Cells.Item[ilinha, 4].Value);
          sIDCONTRIBUICAO  :=  Trim(excel.Cells.Item[ilinha, 6].Value);


          if Trim(sIDPESSOA) = ''       then sIDPESSOA := '0'       else inc(iContCampos);;
          if Trim(sIDCONTRIBUICAO) = '' then sIDCONTRIBUICAO := '0' else inc(iContCampos);;
          if Trim(sIDPLANOPREV) = ''    then sIDPLANOPREV := '0'    else inc(iContCampos);;
          if Trim(sIDPESSJUR) = ''      then sIDPESSJUR := '0'      else inc(iContCampos);;

          if ((sIDPESSOA <> '0') and (sIDCONTRIBUICAO <> '0') and (sIDPLANOPREV <> '0') and (sIDPESSJUR <> '0')) and (iContCampos > 0) then
          begin

            qry.Close;
            qry.sql.Clear;
            qry.Sql.Add( ' Select IDPESSOA, IDCONTRIBUICAO, IDPLANOPREV, IDPESSJUR from cm.CONTRIBPREVPARTP '
                              + ' where IDPESSOA =  ' + sIDPESSOA
                              + ' and IDCONTRIBUICAO =  ' + sIDCONTRIBUICAO
                              + ' and IDPLANOPREV =  ' + sIDPLANOPREV
                              + ' and IDPESSJUR =  ' + sIDPESSJUR );
            try
              qry.open;
            except
              on E: Exception do
              begin
                ShowMessage('Erro: ' + E.Message);
                Close;
              end;
            end;

            if qry.recordcount = 1 then
            begin
              sSqlAux := '';
              wqryUpdate.Close;
              sSqlAux := ' delete from cm.CONTRIBPREVPARTP '
                       + ' where IDPESSOA =  ' + sIDPESSOA
                       + ' and IDCONTRIBUICAO =  ' + sIDCONTRIBUICAO
                       + ' and IDPLANOPREV =  ' + sIDPLANOPREV
                       + ' and IDPESSJUR =  ' + sIDPESSJUR;
              wqryUpdate.SQL.Text := sSqlAux;
              wqryUpdate.ExecSql;
              mmoArquivo1.Lines.Add('--> Registro Excluido: ' + Trim(excel.Cells.Item[ilinha, 1].text)
                                                              + '-' + Trim(excel.Cells.Item[ilinha, 3].text)
                                                              + '-' + Trim(excel.Cells.Item[ilinha, 4].text)
                                                              + '-' + Trim(excel.Cells.Item[ilinha, 6].text));
              wqryUpdate.Close;

              iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');
              wqryUpdate.SQL.Text := 'INSERT INTO LOGTOTALPREV ' + #13 + '( ' + #13 + 'IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDPESQUISA1, IDUSUARIO, DATA ' + #13 + ') ' + #13
                                   + 'VALUES ' + #13 + '(' + IntToStr(iIdLogTotalPREV) + ', ' + IntToStr(Sistema.IdModulo) + ', ' + '''' + 'Exclusão do Histórico de Reserva em lote.' + ''', '
                                   + sIDPESSOA + '-' + sIDCONTRIBUICAO + '-' + sIDPLANOPREV + '-' + sIDPESSJUR + ', ' + IntToStr(Sistema.IdUsuario) + ', ' + ' SYSDATE ' + #13 + ') ';
              wqryUpdate.ExecSql;
            end
            else
            begin
              mmoArquivo1.Lines.Add('--> Registro não localizado: ' + Trim(excel.Cells.Item[ilinha, 1].text)
                                                                    + '-' + Trim(excel.Cells.Item[ilinha, 3].text)
                                                                    + '-' + Trim(excel.Cells.Item[ilinha, 4].text)
                                                                    + '-' + Trim(excel.Cells.Item[ilinha, 6].text));
            end;

          end;
          ilinha := ilinha + 1;
        end
        else
          bSair := False;
      end;
    end;
    *)

    dtmBaseDados.dbBaseDados.Commit;
    mmoArquivo1.Lines.Add('Processo finalizado! ' + 'Total de linhas Processadas: ' + IntToStr(ilinha - 2));
    mmoArquivo1.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------');
    excel.Quit;
    excel := Unassigned;

  except
    dtmBaseDados.dbBaseDados.Rollback;
    excel.Quit;
    excel := Unassigned;
    btn3.Click;
  end;
end;

procedure TFrmAssociarContribuicoesDosParticipantesEmLote.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  edt1.Clear;
  mmoArquivo1.Clear;
end;

procedure TFrmAssociarContribuicoesDosParticipantesEmLote.btn4Click(
  Sender: TObject);
begin
  inherited;
  MsgDlg('Dicas de preenchimento do modelo: ' + #13 + #13 +

         '   --> Os campos destacados em vermelho são de preenchimento obrigatório e não devem ser alterados;' + #13 +
         '   --> O campo "SEQPROPOSTA" deve ser preenchido sempre com o valor: "1"; ' + #13 +
         '   --> Para apagar o valor de qualquer campo, basta preencher o campo com a palavra chave: "NULO";' + #13 +
         '   --> Os campos deixados em branco, zerados ou vazios, não serão considerados, e ficarão inalterados na atualização;'
         , 'Contribuição-Prev', mtInformation, [mbOK], 0);
end;

procedure TFrmAssociarContribuicoesDosParticipantesEmLote.FormShow(
  Sender: TObject);
begin
  inherited;
  rgRgTipoOperacao1Click(Sender);
end;

end.

