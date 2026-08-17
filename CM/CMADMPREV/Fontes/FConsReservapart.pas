unit FConsReservapart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, ComCtrls,
  CMTree, Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmConsReservaPart = class(TfrmSairAjuda)
    pnlParticipante: TPanel;
    lblTexto: TLabel;
    pnlArvore: TPanel;
    ds: TwwDataSource;
    qryReservaXPlano: TwwQuery;
    cmtvTipoReserva: TCMTreeView;
    Label1: TLabel;
    meCodHierarquia: TMaskEdit;
    Label5: TLabel;
    dbedReserva: TDBEdit;
    Label6: TLabel;
    dbedMoeda: TwwDBEdit;
    qryReservaPart: TwwQuery;
    qryCotacao: TwwQuery;
    pnlCotacao: TPanel;
    Label9: TLabel;
    dtCotacao: TCMDateTimePicker;
    Label10: TLabel;
    edValorCot: TEdit;
    lblCotacao: TLabel;
    pnlValores: TPanel;
    lblValores: TLabel;
    Label7: TLabel;
    edValMoeda: TEdit;
    Label8: TLabel;
    edValReal: TEdit;
    lblDescricao: TLabel;
    qryReservaXPlanoCODHIERARQUIA: TStringField;
    qryReservaXPlanoANALITICOSINTETI: TStringField;
    qryReservaXPlanoNOME: TStringField;
    qryReservaXPlanoFLGCONTROLE: TFloatField;
    qryReservaXPlanoIDTIPORESERVA: TFloatField;
    qryReservaXPlanoINDICEREAJUSTE: TFloatField;
    qryReservaXPlanoMOESIGLA: TStringField;
    pnlDados: TPanel;
    Label2: TLabel;
    edNome: TEdit;
    lblPatro: TLabel;
    edPatro: TEdit;
    Label3: TLabel;
    edPlano: TEdit;
    qryHistMovReserva: TwwQuery;
    qryAux: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure qryReservaXPlanoAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedMoedaChange(Sender: TObject);
    procedure dtCotacaoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    bPegaUltimaDataCotacao: boolean;  
    procedure MostraValor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsReservaPart: TfrmConsReservaPart;
  lIdPessoa,lIdPessJur,lIdPlanoPrev, lSeqProposta : integer; // identificadores do participante/Patrocinadora
  sNomeParticip, sNomePatro, sNomePlano, sTipo, sFlgColetiva: string;
  procedure ConsultaReserva(pIdPessoa, pSeqProposta, pIdpessJur, pIdPlanoPrev, pNomeParticip, pNomePatro, pNomePlano, pTipo: string);

 implementation

uses
   UAdmPrev, USistema, UMensErro;
   
{$R *.DFM}

procedure ConsultaReserva(pIdPessoa, pSeqProposta, pIdpessJur, pIdPlanoPrev, pNomeParticip, pNomePatro, pNomePlano, pTipo: string);
begin
  Application.CreateForm(TfrmConsReservaPart, frmConsReservaPart);

  lIdPessoa     := StrToInt(pIdPessoa);
  lIdPessJur    := StrToInt(pIdPessJur);
  lIdPlanoPrev  := StrToInt(pIdPlanoPrev);
  lSeqProposta  := StrToInt(pSeqProposta);
  sNomeParticip := pNomeParticip;
  sNomePatro    := pNomePatro;
  sNomePlano    := pNomePlano;
  sTipo         := pTipo;


  frmConsReservaPart.ShowModal;
  frmConsReservaPart.Free;
end;

procedure TfrmConsReservaPart.FormShow(Sender: TObject);
begin
  inherited;
  if sTipo = 'PARTICIPANTE'
  then begin // Consulta Reservas do Participante
     Caption := 'Consulta de Reservas do Participante';
     lblTexto.Caption := 'Participante Previdenciário';
     edNome.Text := sNomeParticip;
     lblPatro.Visible := True;
     edPatro.Visible  := True;
     edPatro.Text := sNomePatro;
     edPlano.Text := sNomePlano;
     sFlgColetiva := '0';
     lblDescricao.Caption := 'Esta Reserva não pertence a este Participante.';
     pnlDados.Height := 85;
     HelpContext := 160182;
  end
  else begin
     Caption := 'Consulta de Reservas da Fundação';
     lblTexto.Caption := 'Fundação';
     edNome.Text := sNomePatro;
     lblPatro.Visible := False;
     edPatro.Visible  := False;
     edPlano.Text := sNomePlano;
     sFlgColetiva := '1';
     lblDescricao.Caption := 'Esta Reserva não pertence a esta Patrocinadora.';
     pnlDados.Height := 53;
     HelpContext := 160180;
  end;


  //sMascTpReserva => essa variavel e carregada na funcao UAdmPrev
  meCodHierarquia.EditMask := sMascTpReserva + ';0;_';
  cmtvTipoReserva.Mascara  := sMascTpReserva;

  qryReservaPart.Close;
  qryCotacao.Close;

  qryReservaXPlano.Close;
  qryReservaXPlano.SQL.Clear;
  qryReservaXPlano.SQL.Add(' SELECT R.CODHIERARQUIA, R.ANALITICOSINTETI, R.NOME, ' +
                           '        R.FLGCONTROLE, R.IDTIPORESERVA, R.INDICEREAJUSTE, ' +
                           '        M.MOESIGLA ' +
                           ' FROM  RESERVAXPLANO R, MOEDA M ' +
                           ' WHERE R.IDPLANOPREV = ' + IntToStr(lIdPlanoPrev) + ' AND ' +
                           '       R.INDICEREAJUSTE = M.MOECODIGO(+) AND ' +
                           '       R.FLGCOLETIVA = ' + '' + sFlgColetiva + '' +
                           ' ORDER BY CODHIERARQUIA ');
  qryReservaXPlano.Open;
  cmtvTipoReserva.MontaArvore;

  if qryReservaXPlano.IsEmpty then
     cmtvTipoReserva.Enabled := False
  else
     cmtvTipoReserva.Enabled := True;
end;

procedure TfrmConsReservaPart.FormActivate(Sender: TObject);
begin
  inherited;
  dtCotacao.Text   := FormatDateTime('dd/mm/yyyy', Date);
  MostraValor;
end;

procedure TfrmConsReservaPart.MostraValor;
var
  rValTotalMoeda, rValTotalReal, rValCota, rValMoeda, rValReal :real;
begin
  inherited;

  if (not qryReservaxPlano.Active) or (qryReservaXPlano.IsEmpty)
  then Exit;

  meCodHierarquia.Text := qryReservaXPlano.FieldByName('CODHIERARQUIA').AsString;
  qryReservaPart.Close;

  if qryReservaXPlano.FieldByName('ANALITICOSINTETI').AsString = 'S'
  then begin //Sintetica -> exibir soma das analiticas em real
     if qryReservaXPlano.FieldByName('FLGCONTROLE').AsString = '0'
     then lblValores.Caption := 'Valores Totais da Reserva Ativa'
     else lblValores.Caption := 'Valores Totais da Reserva de Controle';

     qryReservaPart.SQL.Clear;
     qryReservaPart.SQL.Add(' SELECT RP.IDTIPORESERVA,RP.INDICEREAJUSTE,R.VALORRESERVA '+
                            ' FROM   RESERVAPART R, RESERVAXPLANO RP '+
                            ' WHERE  R.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                            '        R.IDPESSOA    = '+IntToStr(lIdPessoa)+' AND '+
                            '        R.IDPESSJUR   = '+IntToStr(lidPessjur)+' AND ' +
                            '        R.SEQPROPOSTA = '+IntToStr(lSeqProposta)+' AND '+
                            '        R.IDTIPORESERVA = RP.IDTIPORESERVA AND '+
                            '        RP.FLGCONTROLE  = 0 AND ' +
                            '        RP.CODHIERARQUIA LIKE '''+qryReservaxPlano.FieldByName('CODHIERARQUIA').AsString+'%'' '+
                            ' ORDER BY RP.CODHIERARQUIA ');
     qryReservaPart.Open;
     if qryReservaPart.IsEmpty
     then begin
        if sTipo = 'PARTICIPANTE' // Consulta Reservas do Participante
        then lblDescricao.Caption := 'Esta Reserva não pertence a este Participante.'
        else lblDescricao.Caption := 'Esta Reserva não pertence a esta Patrocinadora.';
     end
     else lblDescricao.Caption := '';
     pnlCotacao.Visible := False; // Se a Reserva for Sintetica, ao inves de mostrar o somatorio, nao mostrar valor nenhum.
     pnlValores.Visible := False;

     rValTotalMoeda := 0;
     rValTotalReal := 0;
     qryReservaPart.First;
     while not qryReservaPart.Eof do
     begin
        rValMoeda := StrToFloat(FormatFloat('#0.000000',qryReservaPart.FieldByName('VALORRESERVA').AsFloat));
        // Buscar cotacao do dia
        qryCotacao.Close;
        qryCotacao.ParamByName('iIdMoeda').AsInteger := qryReservaPart.FieldByName('INDICEREAJUSTE').AsInteger;
        qryCotacao.Open;

        if (qryCotacao.IsEmpty) or (qryCotacao.FieldByName('COTVALOR').AsString = '')
        then rValCota := 1
        else rValCota := StrToFloat(FormatFloat('#0.000000',qryCotacao.FieldByName('COTVALOR').AsFloat));
        edValorCot.Text := FormatFloat('#0.000000',rValCota);

        // Calcular valor em real
        // Ex.: Moeda = Dolar
        //      valorReal = valorDolar * cotacaoDolar
        rValReal := rValCota * rValMoeda;
        rValReal := StrToFloat(FormatFloat('#0.00',rValReal));
        rValTotalReal := rValTotalReal + rValReal;
        rValTotalMoeda := rValTotalMoeda + rValMoeda;
        qryReservaPart.Next;
     end;//while
     edValReal.Text := FormatFloat('#0.00',rValTotalReal);
     edValMoeda.Text := FormatFloat('#0.000000',rValTotalMoeda);
  end
  else begin //Analitica -> exibir valor em real
     //  Verifica se a reserva é ativa ou de Controle
     if qryReservaXPlano.FieldByName('FLGCONTROLE').AsString = '0'
     then lblValores.Caption := 'Valores da Reserva Ativa'
     else lblValores.Caption := 'Valores da Reserva de Controle';

     qryReservaPart.SQL.Clear;
     if Trim(qryReservaxPlano.FieldByName('IDTIPORESERVA').AsString) <> ''
     then qryReservaPart.SQL.Add(' SELECT * FROM RESERVAPART '+
                                 ' WHERE IDPLANOPREV   = '+IntToStr(lIdPlanoPrev)+' AND '+
                                 '       IDPESSOA      = '+IntToStr(lIdPessoa)+' AND '+
                                 '       IDPESSJUR     = '+IntToStr(lidPessjur)+' AND '+
                                 '       SEQPROPOSTA   = '+inttostr(lSeqProposta)+' AND '+
                                 '       IDTIPORESERVA = '+qryReservaxPlano.FieldByName('IDTIPORESERVA').AsString)
     else qryReservaPart.SQL.Add(' SELECT * FROM RESERVAPART '+
                                 ' WHERE IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                                 '       IDPESSOA    = '+IntToStr(lIdPessoa)+' AND '+
                                 '       SEQPROPOSTA = '+inttostr(lSeqProposta)+' AND '+
                                 '       IDPESSJUR   = '+IntToStr(lidPessjur));
     qryReservaPart.Open;

     // Se a reserva não pertencer ao participante ou a Patrocinadora
     if qryReservaPart.IsEmpty
     then begin
        if sTipo = 'PARTICIPANTE' // Consulta Reservas do Participante
        then lblDescricao.Caption := 'Esta Reserva não pertence a este Participante.'
        else lblDescricao.Caption := 'Esta Reserva não pertence a esta Patrocinadora.';
        pnlValores.Visible := False; // Mostra lblDescricao(mensagem)
     end
     else pnlValores.Visible := True;
     pnlCotacao.Visible := True;

     rValMoeda := StrToFloat(FormatFloat('#0.000000',qryReservaPart.FieldByName('VALORRESERVA').AsFloat));
     edValMoeda.Text := FormatFloat('#0.000000',rValMoeda);

     // Buscar cotacao do dia
     qryCotacao.Close;
     qryCotacao.ParamByName('iIdMoeda').AsInteger := qryReservaxPlano.FieldByName('INDICEREAJUSTE').AsInteger;
     qryCotacao.Open;

     if (qryCotacao.IsEmpty) or (qryCotacao.FieldByName('COTVALOR').AsString = '')
     then rValCota := 1
     else RValCota := StrToFloat(FormatFloat('#0.000000',qryCotacao.FieldByName('COTVALOR').AsFloat));
     edValorCot.Text := FormatFloat('#0.000000',rValCota);

     // Calcular valor em real
     // Ex.: Moeda = Dolar
     //      valorReal = valorDolar * cotacaoDolar
     rValReal := rValCota * rValMoeda;
     rValReal := StrToFloat(FormatFloat('#0.00',rValReal));
     edValReal.Text := FormatFloat('#0.00',rValReal);
     edValMoeda.Text := FormatFloat('#0.000000',rValMoeda);
  end; // else
end;


procedure TfrmConsReservaPart.qryReservaXPlanoAfterScroll(DataSet: TDataSet);
begin
  MostraValor;
end;

procedure TfrmConsReservaPart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryReservaPart.Close;
  qryCotacao.Close;
  qryReservaxPlano.Close;

  inherited;
end;

procedure TfrmConsReservaPart.dbedMoedaChange(Sender: TObject);
begin
  inherited;
  lblCotacao.Caption := 'Cotação da Moeda ' + Trim(dbedMoeda.Text);
end;

procedure TfrmConsReservaPart.dtCotacaoExit(Sender: TObject);
begin
  inherited;
  if dtCotacao.Text = '' then
     bPegaUltimaDataCotacao := True
  else
     bPegaUltimaDataCotacao := False;

  MostraValor;
end;

end.
