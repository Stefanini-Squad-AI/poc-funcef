// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Nº SIG.....: SIG TIBERO
// Data.......: 06/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
// -----------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 04.01.2005
// Alteração   : inclusão do /*RULE*/ na consulta por detalhe
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Augusto
// Data        : 27/06/2003
// Alteração   : Indices agora são buscados da COTACAOMOEDA e não do histórico
//               de Movimentação de reserva  
// -----------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Augusto
// Data        : 11/04/2003
// Alteração   : Retirada do campo PLNCODIGO do Relatorio
// -----------------------------------------------------------------------------
unit fPRelConsolidaMovRes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  Wwdatsrc, CheckLst;

type
  TfrmPRelConsolidaMovRes = class(TfrmOkCancelar)
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    GroupBox1: TGroupBox;
    cmbPlano: TwwDBLookupCombo;
    qryPlano: TwwQuery;
    GroupBox2: TGroupBox;
    chklstReserva: TCheckListBox;
    qryReserva: TwwQuery;
    dsPlano: TwwDataSource;
    GroupBox3: TGroupBox;
    cmbPatro: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    bbtnPatroInverte: TBitBtn;
    bbtnPatroTodas: TBitBtn;
    qryAux: TwwQuery;
    procedure cmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnPatroTodasClick(Sender: TObject);
    procedure bbtnPatroInverteClick(Sender: TObject);
  private
    { Private declarations }
    function  BuscaSaldoAnterior ( piIdPessJur,
                                   piIdPlanoPrev,
                                   piIdTipoReserva : longint;
                                   psAnoMesInicial : string ) : double;

  public
    { Public declarations }
  end;

var
  frmPRelConsolidaMovRes: TfrmPRelConsolidaMovRes;

implementation

{$R *.DFM}

Uses DRelatGerencial, UMensErro, UAdmPrev, UFuncoesUteis, UMovReserva;

function  TfrmPRelConsolidaMovRes.BuscaSaldoAnterior ( piIdPessJur,
                                                       piIdPlanoPrev,
                                                       piIdTipoReserva : longint;
                                                       psAnoMesInicial : string ) : double;
var bAchouSaldo  : boolean;
    iTentativas  : word;
    sAnoMesBusca : string;
begin
   Result       := 0;
   bAchouSaldo  := False;
   iTentativas  := 0;
   sAnoMesBusca := SAnoMesAnterior(psAnoMesInicial);

   while (not bAchouSaldo) and (iTentativas <= 24 ) do
   begin
      with qryAux do
      begin
         Close;
         SQL.Clear;
//         SQL.Add(' SELECT /*+ RULE */ NVL(SUM(DECODE(HANT.FLGENTRADA,0,-HANT.VLRCOTAS,HANT.VLRCOTAS)),0) AS SALDOANTERIOR     '+ //Everson TIBERO
         SQL.Add(' SELECT NVL(SUM(DECODE(HANT.FLGENTRADA,0,-HANT.VLRCOTAS,HANT.VLRCOTAS)),0) AS SALDOANTERIOR                   '+ //Everson TIBERO
                 ' FROM   HISTMOVRESERVA HANT                                                       '+
                 ' WHERE  HANT.DATAALIMENTACAO <= ( SELECT MAX(DATAALIMENTACAO) FROM HISTMOVRESERVA  '+
                 '                        WHERE  IDPESSJUR        = '+IntToStr(piIdPessJur)          +
                 '                        AND    IDPLANOPREV      = '+IntToStr(piIdPlanoPrev)        +
                 '                        AND    IDTIPORESERVA    = '+IntToStr(piIdTipoReserva)      +
                 '                        AND    TO_CHAR(DATAALIMENTACAO, ''YYYY/MM'') <= '''+sAnoMesBusca+''') '+
                 ' AND    HANT.IDPESSJUR        = '+IntToStr(piIdPessJur)    +
                 ' AND    HANT.IDPLANOPREV      = '+IntToStr(piIdPlanoPrev)  +
                 ' AND    HANT.IDTIPORESERVA    = '+IntToStr(piIdTipoReserva) );
         Open;
         if (not IsEmpty) 
         then begin
            Result      := FieldByName('SALDOANTERIOR').AsFloat;
            bAchouSaldo := True;
         end;
      end;
      sAnoMesBusca := SAnoMesAnterior(sAnoMesBusca);
      inc(iTentativas);
   end;

end; // BuscaSaldoAnterior

procedure TfrmPRelConsolidaMovRes.cmbPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  chklstReserva.Items.Clear;
  If cmbPlano.Text = '' Then Exit;
  While Not qryReserva.Eof Do
  Begin
    chklstReserva.Items.Add(qryReserva.FieldByName('NOME').AsString);
    qryReserva.Next;
  End;

end;

procedure TfrmPRelConsolidaMovRes.bbtnConfirmarClick(Sender: TObject);
Var
   sReservas,
   sMesAnoAtual,
   sDataBuscaCota : String;

   dVALORINDICE,
   dSALDOANTERIOR,
   dENTRADAS,
   dBENEFICIOS,
   dDEVOLUCOES,
   dSALDO_MES   : double;
   iPlnCodigo : longint;

   i : word;
begin
  inherited;
  // VERIFICA CAMPOS
  If cmbMesRef.Text = '' Then
  Begin
    MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    ModalResult := mrNone;
    Exit;
  End;

  If cmbPlano.Text = '' Then
  Begin
    MsgDlg('Plano Previdenciário não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    ModalResult := mrNone;
    Exit;
  End;

  // ALIMENTA/TRATA VARIÁVEIS PARA MONTAR SQL DO RELATÓRIOS
  sReservas := '';
  For i := 0 To chklstReserva.Items.Count - 1 Do
  Begin
    If chklstReserva.Checked[I] Then
      If qryReserva.Locate('NOME',chklstReserva.Items[I],[]) Then
        sReservas := sReservas + qryReserva.FieldByName('IDTIPORESERVA').AsString+', ';
  End;
  If Trim(sReservas) <> '' Then
  // RETIRAR A VÍRGULA
    sReservas := Copy(sReservas,1,Length(sReservas) - 2);

  // ANOMES ATUAL
  sMesAnoAtual := Trim(spedAnoRef.Text)+'/';
  If cmbMesRef.ItemIndex <= 8 Then
    sMesAnoAtual := sMesAnoAtual + '0' + IntToStr(cmbMesRef.ItemIndex+1)
  Else sMesAnoAtual := sMesAnoAtual + IntToStr(cmbMesRef.ItemIndex+1);


  // MONTAR QUERY EM COTAS
  with dtmRelatorioGerencial.qryConsolidaMovResCotas do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT PAT.NOME PATROCINADORA,        '+
             '        PL.NOME AS PLANO,              '+
             '        RP.CODHIERARQUIA,              '+
             '        RP.NOME AS NOMERESERVA,        '+
             '        PLP.IDPESSJUR,                 '+
             '        PLP.IDPLANOPREV,               '+
             '        RP.IDTIPORESERVA,              '+
             '        RP.INDICEREAJUSTE,             '+
             '        M.MOESIGLA,                    '+
             '        M.MOEDESC AS NOMEINDICE,       '+
             ''''+Copy(sMesAnoAtual,6,2)+'/'+Copy(sMesAnoAtual,1,4)+''' AS MESANOREFERENCIA, '+
             '        0 PLNPLANIL ,                  '+
             '        0 AS VALORINDICE,              '+
             '        0 AS SALDOANTERIOR,            '+
             '        0 AS ENTRADAS,                 '+
             '        0 AS BENEFICIOS,               '+
             '        0 AS DEVOLUCOES,               '+
             '        0 AS SALDO_MES                 '+
             ' FROM   RESERVAXPLANO RP, PESSOA PAT, PLANPREV PL, PLANPREVPATRO PLP, MOEDA M  '+
             ' WHERE  PL.IDPLANOPREV  = PLP.IDPLANOPREV                             '+
             ' AND    PAT.IDPESSOA    = PLP.IDPESSJUR                               '+
             ' AND    RP.IDPLANOPREV  = PLP.IDPLANOPREV                             '+
             ' AND    RP.ANALITICOSINTETI = ''A''                                   '+
             ' AND    M.MOECODIGO(+)      = RP.INDICEREAJUSTE                       ');

     // PATROCINADORA
     If cmbPatro.text <> '' then SQL.Add(' AND   PLP.IDPESSJUR   =  '+qryPatro.FieldByName('IDPESSOA').AsString);

     // PLANO
     If cmbPlano.text <> '' then SQL.Add(' AND   PLP.IDPLANOPREV   = '+qryPlano.FieldByName('IDPLANOPREV').AsString);

     // RESERVAS
     If sReservas <> '' then SQL.Add(' AND   RP.IDTIPORESERVA IN ('+sReservas+')');

     SQL.Add(' ORDER BY PAT.NOME, PL.NOME, M.MOESIGLA, M.MOEDESC, RP.CODHIERARQUIA ');
     Open;
     First;
  end;

  // MONTAR QUERY EM REAL
  with dtmRelatorioGerencial.qryConsolidaMovResReal do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT PAT.NOME PATROCINADORA,        '+
             '        PL.NOME AS PLANO,              '+
             '        RP.CODHIERARQUIA,              '+
             '        RP.NOME AS NOMERESERVA,        '+
             '        PLP.IDPESSJUR,                 '+
             '        PLP.IDPLANOPREV,               '+
             '        RP.IDTIPORESERVA,              '+
             '        M.MOESIGLA,                    '+
             '        M.MOEDESC AS NOMEINDICE,       '+
             ''''+Copy(sMesAnoAtual,6,2)+'/'+Copy(sMesAnoAtual,1,4)+''' AS MESANOREFERENCIA, '+
             '        0 PLNPLANIL ,                  '+
             '        0 AS VALORINDICE,              '+
             '        0 AS SALDOANTERIOR,            '+
             '        0 AS ENTRADAS,                 '+
             '        0 AS BENEFICIOS,               '+
             '        0 AS DEVOLUCOES,               '+
             '        0 AS SALDO_MES                 '+
             ' FROM   RESERVAXPLANO RP, PESSOA PAT, PLANPREV PL, PLANPREVPATRO PLP, MOEDA M, PATRO PT '+ 
             ' WHERE  PL.IDPLANOPREV      = PLP.IDPLANOPREV                         '+
             ' AND    PAT.IDPESSOA        = PLP.IDPESSJUR                           '+
             ' AND    PT.IDPESSOA         = PLP.IDPESSJUR                           '+ 
             ' AND    PT.IDFUNDACAO       = '+IntToStr(iIdFundacao)                  +                                   
             ' AND    RP.IDPLANOPREV      = PLP.IDPLANOPREV                         '+
             ' AND    RP.ANALITICOSINTETI = ''A''                                   '+
             ' AND    M.MOECODIGO(+)      = RP.INDICEREAJUSTE                       ');

     // PATROCINADORA
     If cmbPatro.text <> '' then SQL.Add(' AND   PLP.IDPESSJUR   =  '+qryPatro.FieldByName('IDPESSOA').AsString);

     // PLANO
     If cmbPlano.text <> '' then SQL.Add(' AND   PLP.IDPLANOPREV   = '+qryPlano.FieldByName('IDPLANOPREV').AsString);

     // RESERVAS
     If sReservas <> '' then SQL.Add(' AND   RP.IDTIPORESERVA IN ('+sReservas+')');

     SQL.Add(' ORDER BY PAT.NOME, PL.NOME, M.MOESIGLA, M.MOEDESC, RP.CODHIERARQUIA ');
     Open;
     First;
  end;


  with dtmRelatorioGerencial.qryConsolidaMovResCotas do
  begin
     // Para cada tipo de reserva, preencher o saldo anterior e os outros campos
     while not Eof do
     begin
        dSALDOANTERIOR  := 0;
        dVALORINDICE    := 0;
        dENTRADAS       := 0;
        dBENEFICIOS     := 0;
        dDEVOLUCOES     := 0;
        dSALDO_MES      := 0;
        iPlnCodigo      := 0;

        dSALDOANTERIOR := BuscaSaldoAnterior( FieldByName('IDPESSJUR').AsInteger,
                                              FieldByName('IDPLANOPREV').AsInteger,
                                              FieldByName('IDTIPORESERVA').AsInteger,
                                              sMesAnoAtual );
        {----------------------------------------------------------------------}
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQl.Add(' SELECT '+ 
//                       ' /*+ RULE */ '+  //Everson TIBERO
                       '        NVL(SUM( DECODE(HATUAL.FLGENTRADA, 1, HATUAL.VLRCOTAS, 0)),0) AS ENTRADAS,                                   '+
                       '        NVL(SUM( DECODE(HATUAL.FLGENTRADA, 1, 0,                                                                     '+
                       '                                         DECODE(HATUAL.IDBENEFICIO, NULL, 0, HATUAL.VLRCOTAS))),0) AS BENEFICIOS,    '+
                       '        NVL(SUM( DECODE(HATUAL.FLGENTRADA, 1, 0,                                                                     '+
                       '                                         DECODE(HATUAL.IDCONTRIBUICAO, NULL, 0, HATUAL.VLRCOTAS))),0) AS DEVOLUCOES  '+
                       ' FROM  HISTMOVRESERVA HATUAL                                                                                         '+
                       ' WHERE TO_CHAR(HATUAL.DATAALIMENTACAO, ''YYYY/MM'') = '''+sMesAnoAtual+'''                                                   '+
                       ' AND   HATUAL.IDPESSJUR     = '+FieldByName('IDPESSJUR').AsString                                                     +
                       ' AND   HATUAL.IDPLANOPREV   = '+FieldByName('IDPLANOPREV').AsString                                                   +
                       ' AND   HATUAL.IDTIPORESERVA = '+FieldByName('IDTIPORESERVA').AsString);                                                  
        qryAux.Open;

        if not qryAux.IsEmpty
        then begin
           dENTRADAS       := qryAux.FieldByName('ENTRADAS').AsFloat;
           dBENEFICIOS     := qryAux.FieldByName('BENEFICIOS').AsFloat;
           dDEVOLUCOES     := qryAux.FieldByName('DEVOLUCOES').AsFloat;
        end;
           sDataBuscaCota  := IntToStr(TrazUltDiaMes(StrToInt(Copy(sMesAnoAtual,6,2)), StrToInt(Copy(sMesAnoAtual,1,4))))+'/'+Copy(sMesAnoAtual,6,2)+'/'+Copy(sMesAnoAtual,1,4);
           dVALORINDICE    := VoltaValorCotacao( qryAux,
                                                 FieldByName('INDICEREAJUSTE').AsString,
                                                 FieldByName('IDPLANOPREV').AsString,
                                                 FieldByName('IDTIPORESERVA').AsString,
                                                 sDataBuscaCota );

        {----------------------------------------------------------------------}

        Edit;
        FieldByName('VALORINDICE').AsFloat      := dVALORINDICE;
        FieldByName('PLNPLANIL').AsFloat        := iPlnCodigo;
        FieldByName('SALDOANTERIOR').AsFloat    := dSALDOANTERIOR;
        FieldByName('ENTRADAS').AsFloat         := dENTRADAS;
        FieldByName('BENEFICIOS').AsFloat       := dBENEFICIOS;
        FieldByName('DEVOLUCOES').AsFloat       := dDEVOLUCOES;
        FieldByName('SALDO_MES').AsFloat        := (dSALDOANTERIOR + dENTRADAS) - (dBENEFICIOS + dDEVOLUCOES);
        Post;

        // Alimentar query do valor em real
        with dtmRelatorioGerencial.qryConsolidaMovResReal do
        begin
           Edit;
           FieldByName('VALORINDICE').AsFloat      := dVALORINDICE;
           FieldByName('SALDOANTERIOR').AsFloat    := dSALDOANTERIOR * dVALORINDICE;
           FieldByName('ENTRADAS').AsFloat         := dENTRADAS * dVALORINDICE;
           FieldByName('BENEFICIOS').AsFloat       := dBENEFICIOS * dVALORINDICE;
           FieldByName('DEVOLUCOES').AsFloat       := dDEVOLUCOES * dVALORINDICE;
           FieldByName('SALDO_MES').AsFloat        := ((dSALDOANTERIOR + dENTRADAS) - (dBENEFICIOS + dDEVOLUCOES)) * dVALORINDICE;
           Post;
        end;


        Next;
        dtmRelatorioGerencial.qryConsolidaMovResReal.Next;
     end // while
  end; // with
end;

procedure TfrmPRelConsolidaMovRes.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;

  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPlano.Open;

  qryReserva.Open;
end;

procedure TfrmPRelConsolidaMovRes.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12) then
  begin
    cmbMesRef.ItemIndex := AMonth - 1;
    cmbMesRef.Text := cmbMesRef.Items[cmbMesRef.ItemIndex];
    spedAnoRef.Text := IntToStr(AYear);
  end;
end;

procedure TfrmPRelConsolidaMovRes.bbtnPatroTodasClick(Sender: TObject);
Var i: Integer;
begin
  inherited;
  For I := 0 To chklstReserva.Items.Count - 1 Do
    chklstReserva.checked[I]:= True;
end;

procedure TfrmPRelConsolidaMovRes.bbtnPatroInverteClick(Sender: TObject);
Var i: Integer;
begin
  inherited;
  For I := 0 To chklstReserva.Items.Count - 1 Do
    chklstReserva.checked[I] := Not chklstReserva.checked[I];
end;

end.
