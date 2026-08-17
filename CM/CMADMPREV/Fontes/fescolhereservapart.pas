unit FEscolheReservaPart;

////////////////////////////////////////////////////////////////////////////////
// Alterações
////////////////////////////////////////////////////////////////////////////////
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConsReservapart, Db, DBTables, Wwquery, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TB97, wwdbedit, DBCtrls, Mask, ComCtrls, CMTree,
  ExtCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmEscolheReservaPart = class(TfrmConsReservaPart)
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryReservaXPlanoAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cmtvTipoReservaChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolheReservaPart: TfrmEscolheReservaPart;
  procedure ConsultaReserva(pIdPessoatrans,sseqpropostatrans, pIdpessJurtrans, pIdPlanoPrevtrans, pNomeParticip, pNomePatro, pNomePlano, pTipo: string);

implementation

uses FEventoTransfReserva, UDataBase, UMensErro, UAdmPrev, UMovReserva ;

{$R *.DFM}

procedure TfrmEscolheReservaPart.bbtnSairClick(Sender: TObject);
begin
sNomeReserva := '';
sIdReserva := '';
  inherited;

end;

procedure ConsultaReserva(pIdPessoatrans,sseqpropostatrans,pIdpessJurtrans, pIdPlanoPrevtrans, pNomeParticip, pNomePatro, pNomePlano, pTipo: string);
begin
  Application.CreateForm(TfrmEscolheReservaPart, frmEscolheReservaPart);

  lIdPessoa     := StrToInt(pIdPessoatrans);
  lIdPessJur    := StrToInt(pIdPessJurtrans);
  lIdPlanoPrev  := StrToInt(pIdPlanoPrevtrans);
  lSeqProposta  := Strtoint(sseqpropostatrans);
  sNomeParticip := pNomeParticip;
  sNomePatro    := pNomePatro;
  sNomePlano    := pNomePlano;
  sTipo         := pTipo;

  frmEscolheReservaPart.ShowModal;
  frmEscolheReservaPart.Free;
end;


procedure TfrmEscolheReservaPart.bbtnCancelarClick(Sender: TObject);
begin
bbtnSairClick(self);

end;

procedure TfrmEscolheReservaPart.bbtnConfirmarClick(Sender: TObject);
begin
if qryreservaxplano.fieldbyname('ANALITICOSINTETI').AsString = 'S' then
begin
   MsgDlg('Deve-se selecionar uma reserva Analítica.','Erro',mtError,[mbOk],0);
   Exit;
end;

sIdreserva := qryreservaxplano.fieldbyname('idtiporeserva').AsString;
sNomeReserva := qryreservaxplano.fieldbyname('nome').AsString;
sValorReservaMoeda := edValReal.text;
sValorReservaCotas := edValMoeda.text;
sIndiceReajuste :=  qryreservaxplano.fieldbyname('indicereajuste').AsString;
close;
  inherited;

end;

procedure TfrmEscolheReservaPart.FormActivate(Sender: TObject);
begin
//  inherited;
cmtvTipoReserva.FullExpand;
end;

procedure TfrmEscolheReservaPart.qryReservaXPlanoAfterScroll(
  DataSet: TDataSet);
begin


  //  inherited;

end;

procedure TfrmEscolheReservaPart.FormShow(Sender: TObject);
begin
  //inherited;

    if sTipo = 'PARTICIPANTE' then // Consulta Reservas do Participante
     begin
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
     end
  else
     begin
          Caption := 'Consulta de Reservas da Patrocinadora';
          lblTexto.Caption := 'Patrocinadora';
          edNome.Text := sNomePatro;
          lblPatro.Visible := False;
          edPatro.Visible  := False;
          edPlano.Text := sNomePlano;
          sFlgColetiva := '1';
          lblDescricao.Caption := 'Esta Reserva não pertence a esta Patrocinadora.';
          pnlDados.Height := 53;
     end;


  {sMascTpReserva => essa variavel e carregada na funcao UAdmPrev}
  meCodHierarquia.EditMask := sMascTpReserva + ';0;_';
  cmtvTipoReserva.Mascara  := sMascTpReserva;
  dtCotacao.Text := FormatDateTime('dd/mm/yyyy', Date); 
  edValorCot.Text := '';

  qryReservaPart.Close;
  qryCotacao.Close;


  if bReservaDest then
  begin
     qryReservaXPlano.Close;
     qryReservaXPlano.SQL.Clear;
     qryReservaXPlano.SQL.Add('SELECT R.CODHIERARQUIA, R.ANALITICOSINTETI, R.NOME, '+
                              ' R.FLGCONTROLE, R.IDTIPORESERVA, R.INDICEREAJUSTE, '+
                              ' M.MOESIGLA '+
                              ' FROM  RESERVAXPLANO R, MOEDA M '+
                              ' WHERE R.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                              ' R.INDICEREAJUSTE = M.MOECODIGO(+) AND '+
                              ' R.FLGCOLETIVA = ''0'' AND '+
                              ' R.ANALITICOSINTETI = ''S'' AND '+
                              ' R.IDTIPORESERVA <> '+sIdreservaorig+' '+
                              ' UNION '+
                              ' SELECT DISTINCT R.CODHIERARQUIA, R.ANALITICOSINTETI, R.NOME, ' +
                              '        R.FLGCONTROLE, R.IDTIPORESERVA, R.INDICEREAJUSTE, ' +
                              '        M.MOESIGLA ' +
                              ' FROM  RESERVAXPLANO R, MOEDA M, RESERVAXCONTRIB RC, CONTRIBUICAO C, RESERVAPART RP ' +
                              ' WHERE R.IDPLANOPREV = ' + IntToStr(lIdPlanoPrev) + ' AND ' +
                              '       R.INDICEREAJUSTE = M.MOECODIGO(+)  ' +
                              ' AND R.FLGCOLETIVA = 0 '+
                              ' AND RP.IDTIPORESERVA = R.IDTIPORESERVA '+
                              ' AND RP.IDPLANOPREV = R.IDPLANOPREV '+
                              ' AND RP.IDPESSOA =   '+sidpessoatrans+' '+
                              ' AND R.ANALITICOSINTETI = ''A'' '+
                              ' AND RP.IDPESSJUR = '+sidpessjurtrans+' '+
                              ' AND RP.SEQPROPOSTA = '+sseqpropostatrans+' '+
                              ' AND RC.IDCONTRIBUICAO = C.IDCONTRIBUICAO '+
                              ' AND RC.IDPLANOPREV = R.IDPLANOPREV '+
                              ' AND RC.IDTIPORESERVA = R.IDTIPORESERVA '+
                              ' AND R.IDTIPORESERVA <> '+sIdreservaorig+' ');
                    if sTipoPrevidenciaAux = 'A' then
                    begin
                       qryReservaXPlano.sql.add(' AND C.IDBENEFICIO '+
                                      ' IN(SELECT CONTRIBUICAO.IDBENEFICIO'+
                                      ' FROM CONTRIBUICAO, RESERVAXCONTRIB'+
                                      ' WHERE'+
                                      ' RESERVAXCONTRIB.IDTIPORESERVA = '+sIdreservaOrig+''+
                                      ' AND RESERVAXCONTRIB.IDCONTRIBUICAO = CONTRIBUICAO.IDCONTRIBUICAO)');
                    end;
                    qryReservaXPlano.sql.add(' ORDER BY CODHIERARQUIA');

     qryReservaXPlano.Open;
  end
  else
  begin

     qryReservaXPlano.Close;
     qryReservaXPlano.SQL.Clear;
     qryReservaXPlano.SQL.Add(' SELECT R.CODHIERARQUIA, R.ANALITICOSINTETI, R.NOME, '+
                              ' R.FLGCONTROLE, R.IDTIPORESERVA, R.INDICEREAJUSTE, '+
                              ' M.MOESIGLA '+
                              ' FROM  RESERVAXPLANO R, MOEDA M '+
                              ' WHERE R.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+'  AND '+
                              ' R.INDICEREAJUSTE = M.MOECODIGO(+) AND '+
                              ' R.FLGCOLETIVA = ''0'' AND '+
                              ' R.ANALITICOSINTETI = ''S'' '+
                              ' UNION '+
                              ' SELECT R.CODHIERARQUIA, R.ANALITICOSINTETI, R.NOME, '+
                              ' R.FLGCONTROLE, R.IDTIPORESERVA, R.INDICEREAJUSTE, '+
                              '  M.MOESIGLA '+
                              ' FROM  RESERVAXPLANO R, MOEDA M, RESERVAPART RP '+
                              ' WHERE R.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                              ' R.INDICEREAJUSTE = M.MOECODIGO(+) AND '+
                              ' RP.IDTIPORESERVA = R.IDTIPORESERVA '+
                              ' AND RP.IDPLANOPREV = R.IDPLANOPREV '+
                              ' AND RP.IDPESSOA =   '+sidpessoatrans+' '+
                              ' AND R.ANALITICOSINTETI = ''A'' '+
                              ' AND RP.IDPESSJUR = '+sidpessjurtrans+' '+
                              ' AND RP.SEQPROPOSTA = '+sseqpropostatrans+' '+
                              ' AND R.FLGCOLETIVA = ''0'' '+
                              ' ORDER BY CODHIERARQUIA ');
     qryReservaXPlano.Open;
  end;


  cmtvTipoReserva.MontaArvore;

  if qryReservaXPlano.IsEmpty then
     cmtvTipoReserva.Enabled := False
  else
     cmtvTipoReserva.Enabled := True;

end;

procedure TfrmEscolheReservaPart.cmtvTipoReservaChange(Sender: TObject);
var
  rValTotalMoeda,
  rValTotalReal,
  rValCota,
  rValMoeda,
  rValReal :Double;
begin
 
  if (not qryReservaxPlano.Active) or (qryReservaXPlano.IsEmpty) then
      Exit;

  meCodHierarquia.Text := qryReservaXPlano.FieldByName('CODHIERARQUIA').AsString;

  qryReservaPart.Close;

  if qryReservaXPlano.FieldByName('ANALITICOSINTETI').AsString = 'S'
  then begin //Sintetica -> exibir soma das analiticas em real
     if qryReservaXPlano.FieldByName('FLGCONTROLE').AsString = '0' then
        lblValores.Caption := 'Valores Totais da Reserva Ativa'
     else
        lblValores.Caption := 'Valores Totais da Reserva de Controle';

     qryReservaPart.SQL.Clear;
     qryReservaPart.SQL.Add(' SELECT RP.IDTIPORESERVA,RP.INDICEREAJUSTE,R.VALORRESERVA '+
                            ' FROM   RESERVAPART R, RESERVAXPLANO RP '+
                            ' WHERE  R.IDPLANOPREV = '+sidplanoprevtrans+' AND '+
                            '        R.IDPESSOA = '+sidpessoatrans+' AND '+
                            '        R.IDPESSJUR = '+sidpessjurtrans+' AND ' +
                            '        R.SEQPROPOSTA = '+sseqpropostatrans+' AND '+
                            '        R.FLGATIVO = 1 AND '+
                            '        R.IDTIPORESERVA = RP.IDTIPORESERVA AND '+
                            '        RP.FLGCONTROLE = 0 AND ' +
                            '        RP.CODHIERARQUIA LIKE '''+qryReservaxPlano.FieldByName('CodHierarquia').AsString+'%'' '+
                            ' ORDER BY RP.CODHIERARQUIA ');
     qryReservaPart.Open;

    {Se as reservas não pertencerem ao participante}
     if qryReservaPart.IsEmpty then
        pnlValores.Visible := False
     else
        pnlValores.Visible := True;

     rValTotalMoeda := 0;
     rValTotalReal := 0;
     qryReservaPart.First;
     while not qryReservaPart.Eof do
     begin
        rValMoeda := StrToFloat(truncaround(qryReservaPart.FieldByName('ValorReserva').AsString,6));

        // Buscar cotacao do dia
        qryCotacao.Close;
        qrycotacao.sql.clear;
        qrycotacao.sql.add(' SELECT COTDATA,COTVALOR '+
                       ' FROM   COTACAOMOEDA '+
                       ' WHERE  MOECODIGO = :iIdMoeda AND '+
                       '        COTDATA IN '+
                       '        (SELECT MAX(COTDATA) FROM COTACAOMOEDA WHERE MOECODIGO = :iIdMoeda '+
                       ' AND COTDATA <= TO_DATE('''+FrmEventoTransfReserva.dtEvento.text+''',''DD/MM/YYYY''))');
        qryCotacao.ParamByName('iIdMoeda').AsInteger := qryReservaPart.FieldByName('INDICEREAJUSTE').AsInteger;
        qryCotacao.Open;

        if (qryCotacao.IsEmpty) or (qryCotacao.FieldByName('CotValor').AsString = '')
        then rValCota := 1
        else begin
           rValCota := StrToFloat(truncaround(qryCotacao.FieldByName('CotValor').AsString,6));
           dtCotacao.Text := qryCotacao.FieldByName('CotData').AsString;
        end;

        edValorCot.Text := truncaround(floattostr(rValCota),6);
        rValReal := rValCota * rValMoeda;
        rValReal := StrToFloat(truncaround(floattostr(rValReal),2));

        rValTotalReal := rValTotalReal + rValReal;
        rValTotalMoeda := rValTotalMoeda + rValMoeda;
        qryReservaPart.Next;
     end;//while
     edValReal.Text := truncaround(floattostr(rValTotalReal),2);
     edValMoeda.Text := truncaround(floattostr(rValTotalMoeda),6);
  end
  else begin //Analitica -> exibir valor em real
   {Verifica se a reserva é ativa ou de Controle}
     if qryReservaXPlano.FieldByName('FLGCONTROLE').AsString = '0' then
        lblValores.Caption := 'Valores da Reserva Ativa'
     else
        lblValores.Caption := 'Valores da Reserva de Controle';

     qryReservaPart.SQL.Clear;
     if Trim(qryReservaxPlano.FieldByName('IdTipoReserva').AsString) <> ''
     then qryReservaPart.SQL.Add(' SELECT * FROM RESERVAPART '+
                                 ' WHERE IDPLANOPREV = '+sidplanoprevtrans+' AND '+
                                 '       IDPESSOA = '+sidpessoatrans+' AND '+
                                 '       IDPESSJUR = '+sidpessjurtrans+' AND '+
                                 '       SEQPROPOSTA = '+sseqpropostatrans+' AND '+
                                 '       FLGATIVO = 1 AND '+
                                 '       IDTIPORESERVA = '+qryReservaxPlano.FieldByName('IdTipoReserva').AsString)

     else qryReservaPart.SQL.Add(' SELECT * FROM RESERVAPART '+
                                 ' WHERE IDPLANOPREV = '+sidplanoprevtrans+' AND '+
                                 '       IDPESSOA = '+sidpessoatrans+' AND '+
                                 '       SEQPROPOSTA = '+sseqpropostatrans+' AND '+
                                 '       FLGATIVO = 1 AND '+
                                 '       IDPESSJUR = '+sidpessjurtrans);

     qryReservaPart.Open;

    {Se a reserva não pertencer ao participante}
     if qryReservaPart.IsEmpty then
        pnlValores.Visible := False
     else
        pnlValores.Visible := True;

     rValMoeda := StrToFloat(truncaround(qryReservaPart.FieldByName('ValorReserva').AsString,6));

     edValMoeda.Text := truncaround(floattostr(rValMoeda),6);


     // Buscar cotacao do dia
     qryCotacao.Close;
     qrycotacao.sql.clear;
     qrycotacao.sql.add(' SELECT COTDATA,COTVALOR '+
                        ' FROM   COTACAOMOEDA '+
                        ' WHERE  MOECODIGO = :iIdMoeda AND '+
                        '        COTDATA IN '+
                        '        (SELECT MAX(COTDATA) FROM COTACAOMOEDA WHERE MOECODIGO = :iIdMoeda '+
                        ' AND COTDATA <= TO_DATE('''+FrmEventoTransfReserva.dtEvento.text+''',''DD/MM/YYYY''))');

     qryCotacao.ParamByName('iIdMoeda').AsInteger := qryReservaxPlano.FieldByName('INDICEREAJUSTE').AsInteger;
     qryCotacao.Open;

     if (qryCotacao.IsEmpty) or (qryCotacao.FieldByName('CotValor').AsString = '')
     then rValCota := 1
     else begin
        rValCota := StrToFloat(truncaround(qryCotacao.FieldByName('CotValor').AsString,6));
        dtCotacao.Text := qryCotacao.FieldByName('CotData').AsString;
     end;
     edValorCot.Text := truncaround(floattostr(rValCota),6);
     rValReal := rValCota * rValMoeda;
     rValReal := StrToFloat(truncaround(floattostr(rValReal),2));
     edValReal.Text := truncaround(floattostr(rValReal),6);
  end; // else

end;

end.
