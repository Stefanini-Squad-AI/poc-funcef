unit FReaberturaData;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************


{-------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick      
Nº SIG.....: 32303
Data.......: 31/10/2016
Responsável: Edilaine Ferraresi
Descrição..: Equacionamento - separação das contribuições em grupo
-------------------------------------------------------------------------------
Alteração  : (.dfm) gbDataReabre
Nº SOL.....: 253577-18151
KTN / PPM  : 1318910
Data       : 21/03/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - reabertura/renovacao
--------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar,  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti, Db,
  DBTables, Wwquery, Mask, wwdbedit, Wwdotdot, Wwdbcomb, Wwdatsrc, wwdblook,
  MskEdDlg, UBeneficio;

type
  TTipoValidacao = (tvTudo, tvBSFab, tvBaseDeficit);   
  TfrmReaberturaData = class(TfrmOkCancelar)
    gbSituacaoIni: TGroupBox;
    lblDtInicioAntes: TLabel;
    edDtInicioAntes: TEdit;
    lblDtFinalAntes: TLabel;
    edDtFinalAntes: TEdit;
    gbSituacaoPos: TGroupBox;
    lblDtInicio: TLabel;
    dtInicio: TCMDateTimePicker;
    lblDtFinal: TLabel;
    dtFinal: TCMDateTimePicker;
    rgrpReabertura: TRadioGroup;
    rgrpDataPrevEfet: TRadioGroup;
    qryDtEncerra: TwwQuery;
	qryAux: TwwQuery;
    gbDataReabre: TGroupBox;
    dtReabre: TCMDateTimePicker;
    grpDeficit: TGroupBox;
    pnlNaoSaldado: TPanel;
    lblValorAtual: TLabel;
    lblValorTotal: TLabel;
    Label8: TLabel;
    reValorAtual: TcmMaskEditDlg;
    reValorTotal: TcmMaskEditDlg;
    reValorSRB: TcmMaskEditDlg;
    qryBenef: TwwQuery;
    pnlValores: TPanel;
    lblValorBS: TLabel;
    reValorBS: TcmMaskEditDlg;
    lblValorFAB: TLabel;
    reValorFAB: TcmMaskEditDlg;
    lblVlrTotal: TLabel;
    reVlrTotal: TcmMaskEditDlg;
    lblDeficit: TLabel;
    reValorDeficit: TcmMaskEditDlg;
    procedure AjustaTela(sNumeroProcesso : string; pbTemFuncef : boolean);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnAjudaClick(Sender: TObject);
    procedure reValorBSKeyPress(Sender: TObject; var Key: Char);
    procedure reValorFABKeyPress(Sender: TObject; var Key: Char);
    procedure reVlrTotalKeyPress(Sender: TObject; var Key: Char);
    procedure reValorDeficitKeyPress(Sender: TObject; var Key: Char);
    procedure reVlrInssKeyPress(Sender: TObject; var Key: Char);
    procedure reValorSRBKeyPress(Sender: TObject; var Key: Char);
    procedure reValorTotalKeyPress(Sender: TObject; var Key: Char);
    procedure reValorAtualKeyPress(Sender: TObject; var Key: Char);
    procedure reValorBSExit(Sender: TObject);
    procedure reValorFABExit(Sender: TObject);
    procedure reValorDeficitBtnClick(Sender: TObject);
    procedure dtReabreExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }

    bTemFuncef, bTemInss, bNaoSaldado : boolean;
    bFlgApresentaBSFAB    : boolean;
    bFlgApresentaDeficit  : boolean;
    dPercent, dValorTotal : double;

    function  GravaValores : boolean;
    function  CalculaValorDeficit : string;
    function  ValidaDadosCalculoDeficit(TipoValida : TTipoValidacao) : boolean;

    procedure BuscaPercentual;

  public
    { Public declarations }
    bDatasOK      : boolean;
    bErroMensagem : Boolean;

  end;

var
  frmReaberturaData: TfrmReaberturaData;


implementation

uses UMensErro;

{$R *.DFM}

procedure TfrmReaberturaData.FormShow(Sender: TObject);
var
Steste : string;
begin
  inherited;

  dtReabre.setFocus;

end;

procedure TfrmReaberturaData.bbtnConfirmarClick(Sender: TObject);
var bReabertura : boolean;

begin
  bDatasOk := true;
  bErroMensagem := false;


  if (Trim(dtReabre.Text) = '')
  then begin
     MsgDlg('Informe a data de reabertura.','Erro',mtError,[mbOk,mbHelp],0);
     bErroMensagem := true;
     dtReabre.setfocus;
     Abort;
  end;

  if (dtReabre.date < StrToDate(edDtInicioAntes.text))
  then begin
     MsgDlg('A nova data de reabertura não pode ser anterior à data de início cadastrada até o momento.','Erro',mtError,[mbOk,mbHelp],0);
     bErroMensagem := true;
     dtReabre.setfocus;
     Abort;
  end;

  // Se for uma reabertura ou uma renovacao
  // Entao a data de inicio deve ser maior que a data final anterior
  if (edDtFinalAntes.text <> '') and (dtReabre.date  <  StrToDate(edDtFinalAntes.text) )
  then begin
     MsgDlg('A data de reabertura deve ser posterior à data final anterior. ','Erro',mtError,[mbOk,mbHelp],0);
     bErroMensagem := true;
     dtReabre.setfocus;
     Abort;
  end;

  If trim(dtFinal.Text) <> '' Then
    if (dtReabre.date > dtFinal.date )
    then begin
       MsgDlg('A data final deve ser posterior à data de reabertura. ','Erro',mtError,[mbOk,mbHelp],0);
       bErroMensagem := true;
       Abort;
    end;

  If (trim(dtFinal.Text) <> '') and (edDtFinalAntes.text <> '') Then
    if (StrToDate(edDtInicioAntes.text) > dtFinal.date )
    then begin
       MsgDlg('A nova data final deve ser posterior à à data final anterior. ','Erro',mtError,[mbOk,mbHelp],0);
       bErroMensagem := true;
       Abort;
    end;


  if not bNaoSaldado then begin
     if (not ValidaDadosCalculoDeficit(tvTudo) ) then
     begin
       bErroMensagem := true;
       abort;
     end;
  end
  else
  begin
    if reValorSRB.text = '' then
    begin
      MsgDlg('É necessário informar o Valor SRB.', 'Informação', mtInformation, [mbOK], 0);
      reValorSRB.SetFocus;
      bErroMensagem := true;
      Abort;
    end;

    if reValorTotal.text = '' then
    begin
      MsgDlg('É necessário informar o Valor Total do Benefício.', 'Informação', mtInformation, [mbOK], 0);
      reValorTotal.SetFocus;
      bErroMensagem := true;
      abort;
    end;

    if (reValorAtual.text = '') and
       (qryBenef.FieldByName('IDTITULAR').AsString <> qryBenef.FieldByName('IDPESSOA').AsString) then    // Edilaine - SIG32303
    begin
      MsgDlg('É necessário informar o Valor Total do Benefício.', 'Informação', mtInformation, [mbOK], 0);
      reValorAtual.SetFocus;
      bErroMensagem := true;
      abort;
    end;
  end;


  if not GravaValores() then
  begin
     bErroMensagem := true;
     abort;
  end;


  //inherited;
end;


procedure TfrmReaberturaData.bbtnCancelarClick(Sender: TObject);
begin
  bErroMensagem := False;
  inherited;
  ModalResult := mrCancel;
  Close;
end;


procedure TfrmReaberturaData.bbtnAjudaClick(Sender: TObject);
begin
  inherited;
  //HelpContext := 160079 ;
  //bbtnAjuda.HelpContext := 160079;
end;


procedure TfrmReaberturaData.AjustaTela(sNumeroProcesso: string; pbTemFuncef : boolean );
var
   bPensao : boolean;
begin
  reValorFAB.text      := '';
  reValorBS.text       := '';
  reValorDeficit.text  := '';
  bFlgApresentaBSFAB   := false;
  bFlgApresentaDeficit := false;


  {busca dados do beneficio que esta parametrizado para Deficit}
  qryBenef.close;
  qryBenef.SQL.clear;
  qryBenef.SQL.Add('SELECT BF.*, BP.FLGAPRESENTABSFAB, BP.FLGAPRESENTADEFICIT, PP.idsitplanoprev, ');
  qryBenef.SQL.Add('       BP.IDREGRACALCBASEDEFICIT, BP.IDREGRACALCULO, BP.IDREGRAPAGAMENTO,     ');
  qryBenef.SQL.Add('       BP.FLGACTVLRSRB, BP.IDREGRASRB, BP.FLGACTVLRTOTBEN, BP.IdRgValorTotal,  ');
  qryBenef.SQL.Add('       BP.FLGACTVLRATUAL, BP.IdRegraCalculo, B.NUMORDEMEVENTO  ');
  qryBenef.SQL.Add('  FROM BENEFBFCIARIO BF           ');
  qryBenef.SQL.Add('  JOIN BENEFICIO B ON B.IDBENEFICIO = BF.IDBENEFICIO ');
  qryBenef.SQL.Add('  JOIN BENEFPLANPREV BP ON BP.IDPLANOPREV = BF.IDPLANOPREV ');
  qryBenef.SQL.Add('                       AND BP.IDBENEFICIO = BF.IDBENEFICIO ');
  qryBenef.SQL.Add('  LEFT JOIN PARTPREVPLAN PP ON (PP.IDPLANOPREV = BF.IDPLANOORIGEM) ');
  qryBenef.SQL.Add('                           AND (PP.IDPESSOA =  BF.IDTITULAR) ');
  qryBenef.SQL.Add(' WHERE BF.NUMEROPROCESSO IN ('+sNumeroProcesso+')'          );
  qryBenef.SQL.Add(' ORDER BY BF.FONTEPAGADORA  ');
  qryBenef.Open;

  bNaoSaldado := (qryBenef.FieldByName('IDPLANOPREV').AsInteger = 2) and
                 (qryBenef.FieldByName('IDPLANPREVCONTAB').AsInteger = 2) and
                 (qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 1);

  bPensao :=  qryBenef.FieldByName('IDTITULAR').AsString <> qryBenef.FieldByName('IDPESSOA').AsString;

  while not qryBenef.Eof do
  begin
    if qryBenef.FieldbyName('FONTEPAGADORA').AsInteger = 1 then
    begin
      bFlgApresentaBSFAB   := qryBenef.FieldbyName('FLGAPRESENTABSFAB').AsInteger = 1;
      bFlgApresentaDeficit := qryBenef.FieldbyName('FLGAPRESENTADEFICIT').AsInteger = 1;

      if not bNaoSaldado then
      begin
        reValorBS.text      := qryBenef.FieldByName('VLRBSTOTAL').AsString;
        reValorFAB.text     := qryBenef.FieldByName('VLRFABTOTAL').AsString;
        reValorDeficit.text := qryBenef.FieldByName('VLRBASEDEFICIT').AsString;
        reVlrTotal.text     := qryBenef.FieldByName('VALORTOTAL').AsString;
      end
      else
      begin
        reValorSRB.text   := qryBenef.FieldByName('VALORSRB').AsString;
        reValorTotal.text := qryBenef.FieldByName('VALORTOTAL').AsString;
        reValorAtual.text := qryBenef.FieldByName('VALORATUAL').AsString;
      end;
    end
    else
      reVlrTotal.text     := qryBenef.FieldByName('VALORTOTAL').AsString;

    qryBenef.next;
  end;

  {busca data do encerramento para sugerir}
    {Para o mês de Fevereiro, quando a ''Data Final Anterior'' for 28 ou 29
     dependendo se ano bissexto ou não , a ''Nova Data Início'' deve ser o dia
     1 do mês seguinte (Março). Nos demais meses do ano se a ''Data Final Anterior''
     for 30 ou 31, a ''Nova Data Início'' deve ser o dia 1 do mês seguinte.
     Ex: Data Final Anterior = 30/03/2002 a ''Nova Data Inicio''
     deve ser 01/04/2002, pois o mês de 03/2002 já foi pago integral (30 dias).}
  qryDtEncerra.close;
  qryDtEncerra.ParambyName('NUMEROPROCESSO').AsString := sNumeroProcesso;
  qryDtEncerra.Open;
  if (not qryDtEncerra.eof) and (qryDtEncerra.Fields[0].AsString <> '') then
  begin
     dtReabre.text := qryDtEncerra.Fields[0].AsString;
  end;

  {ajusta tela}
  if bNaoSaldado then
  begin
     pnlValores.visible       := false;
     pnlNaoSaldado.visible    := true;
     pnlNaoSaldado.BevelInner := bvNone;
     pnlNaoSaldado.BevelOuter := bvNone;
     pnlNaoSaldado.top  := 20;
     pnlNaoSaldado.left := 5;

     lblValorAtual.visible := bPensao;
     reValorAtual.visible  := bPensao;

     if bPensao then
     begin
       grpDeficit.width  := 390;
       self.width        := 443;
     end;
  end
  else
  begin
    pnlValores.visible    := true;
    pnlValores.BevelOuter := bvNone;
    pnlValores.BevelInner := bvNone;
    pnlNaoSaldado.visible := false;
  end;

  lblValorBS.visible  := bFlgApresentaBSFAB;
  lblValorFAB.visible := bFlgApresentaBSFAB;
  lblDeficit.visible  := bFlgApresentaDeficit;

  reValorBS.visible       := bFlgApresentaBSFAB;
  reValorFAB.visible      := bFlgApresentaBSFAB;
  reValorDeficit.visible  := bFlgApresentaDeficit;

  if (not bFlgApresentaBSFAB) and (bFlgApresentaDeficit) then
  begin
    lblVlrTotal.left := lblValorBS.left;
    reVlrTotal.left  := reValorBS.left;
    reVlrTotal.ReadOnly := false;

    lblDeficit.left     := lblValorFAB.left;
    reValorDeficit.left := reValorFAB.left;

    self.width :=  360;
  end
  else if ((not bFlgApresentaBSFAB) and (not bFlgApresentaDeficit) and (pbTemFuncef) and (not bNaoSaldado)) or
          (not pbTemFuncef) then
  begin
    lblVlrTotal.left := lblValorBS.left;
    reVlrTotal.left  := reValorBS.left;
    reVlrTotal.ReadOnly := false;
  end;

  if ((bNaoSaldado) and (not bPensao)) or (not pbTemFuncef) or
     ((not bFlgApresentaBSFAB) and (not bFlgApresentaDeficit) and (pbTemFuncef) and (not bNaoSaldado)) then
  begin
    pnlValores.width    := 270;
    pnlNaoSaldado.width := 270;
    grpDeficit.width    := 307;
    self.width          := 360;
  end;


  if ((bFlgApresentaBSFAB) and (not bFlgApresentaDeficit)) or ((bNaoSaldado) and (bPensao)) then
  begin
    pnlValores.width    := 380;
    grpDeficit.width    := 385;
    self.width  := 435;
  end;  

  if not pbTemFuncef then
     lblVlrTotal.caption := 'Valor Total INSS';

end;

procedure TfrmReaberturaData.reValorBSKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmReaberturaData.reValorFABKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmReaberturaData.reVlrTotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmReaberturaData.reValorDeficitKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmReaberturaData.reVlrInssKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmReaberturaData.reValorSRBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmReaberturaData.reValorTotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmReaberturaData.reValorAtualKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;


function TfrmReaberturaData.GravaValores: boolean;
var
   dValorAtual  : double;
   sVlrBSAtual  : string;
   sVlrFABAtual : string;
   sVlrDeficit  : string;
   sVlrTotal    : string;
begin

  result := true;

  qryBenef.first;

  if qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 1 then
  begin
    sVlrBSAtual  := reValorBS.text;
    sVlrFABAtual := reValorFAB.text;

    if (not bNaoSaldado) then
    begin
      if (qryBenef.FieldByName('IDPESSOA').AsInteger <> qryBenef.FieldByName('IDTITULAR').AsInteger) then
      begin
        if sVlrBSAtual <> '' then
        begin
          dValorAtual := StrToFloat(reValorBS.text) * (dPercent / 100);
          sVlrBSAtual := FloatToStr( dValorAtual );
        end;

        if sVlrFABAtual <> '' then
        begin
          dValorAtual := StrToFloat(reValorFAB.text) * (dPercent / 100);
          sVlrFABAtual := FloatToStr( dValorAtual );
        end;
      end;

      dValorAtual  := StrToFloat(reVlrTotal.text) * (dPercent / 100);
      sVlrDeficit  := reValorDeficit.text;
      sVlrTotal    := reVlrTotal.text;
    end
    else
    begin
      sVlrBSAtual  := '';
      sVlrFABAtual := '';
      sVlrDeficit  := '';
      if qryBenef.FieldByName('IDTITULAR').AsString = qryBenef.FieldByName('IDPESSOA').AsString then
         reValorAtual.text := reValorTotal.text;
      dValorAtual  := StrToFloat(reValorAtual.text);
      sVlrTotal    := reValorTotal.text;
    end;
  end
  else
  begin
    sVlrBSAtual  := '';
    sVlrFABAtual := '';
    sVlrDeficit  := '';
    sVlrTotal    := reVlrTotal.text;

    dValorAtual  := StrToFloat(reVlrTotal.text) * (dPercent / 100);
  end;

  qryAux.close;
  qryAux.SQL.clear;
  qryAux.Sql.Add(' UPDATE BENEFBFCIARIO SET ');
  qryAux.Sql.Add('        VALORTOTAL  = ' + '''' + sVlrTotal + ''' ');
  qryAux.Sql.Add('       ,VALORATUAL  = ' + '''' + FloatToStr(dValorAtual) + ''' ');
  qryAux.Sql.Add('       ,VLRBSTOTAL  = ' + '''' + reValorBS.text + '''  ');
  qryAux.Sql.Add('       ,VLRBSATUAL  = ' + '''' + sVlrBSAtual + '''     ');
  qryAux.Sql.Add('       ,VLRFABTOTAL = ' + '''' + reValorFAB.text + ''' ');
  qryAux.Sql.Add('       ,VLRFABATUAL = ' + '''' + sVlrFABAtual + '''    ');
  qryAux.Sql.Add('       ,VLRBASEDEFICIT  = ' + '''' + svlrDeficit + ''' ');
  if bNaoSaldado then
     qryAux.Sql.Add('       ,VALORSRB  = ' + '''' + reValorSRB.text + ''' ');
  qryAux.Sql.Add('  WHERE SEQPROPOSTA    = ' + qryBenef.FieldByName('SEQPROPOSTA').AsString  );
  qryAux.Sql.Add('    AND IDPLANOPREV    = ' + qryBenef.FieldByName('IDPLANOPREV').AsString  );   // iIdPlanoPrev,
  qryAux.Sql.Add('    AND IDPESSJUR      = ' + qryBenef.FieldByName('IDPESSJUR').AsString    );   // iIdPessJur,
  qryAux.Sql.Add('    AND IDPESSOA       = ' + qryBenef.FieldByName('IDPESSOA').AsString     );   // iIdPessoa,
  qryAux.Sql.Add('    AND IDTITULAR      = ' + qryBenef.FieldByName('IDTITULAR').AsString    );   // iIdTitular,
  qryAux.Sql.Add('    AND IDBENEFICIO    = ' + qryBenef.FieldByName('IDBENEFICIO').AsString  );   // IdBeneficio
  qryAux.Sql.Add('    AND NUMEROPROCESSO = ' + qryBenef.FieldByName('NUMEROPROCESSO').AsString); // NumeroProcesso

  try
    qryAux.ExecSQL;
  except
    MsgDlg('Ocorreu um erro ao atualizar os valores do benefício.', 'Informação', mtInformation, [mbOK], 0);
    result := false;
  end;
end;


procedure TfrmReaberturaData.BuscaPercentual;
VAR
  sPercentual : string;
begin
  // pega taxa
  dPercent := 0;

  if qryBenef.FieldByName('IDPESSOA').AsInteger <> qryBenef.FieldByName('IDTITULAR').AsInteger then
  begin
    {ESTA REGISTRADA PARA 17664 - QUEM HOMOLOGAR PRIMEIRO LEVA ELA NA LISTA DE PRODUTO}
    if BuscaPercentualGrupoFamiliar(FormatDateTime('YYYY/MM', dtReabre.date),
                                    qryBenef.FieldByName('NUMEROPROCESSO').AsString,
                                    qryBenef.FieldByName('IDPLANOPREV').AsInteger,
                                    qryBenef.FieldByName('IDBENEFICIO').AsInteger,
                                    qryBenef.FieldByName('IDPESSJUR').AsInteger,
                                    qryBenef.FieldByName('IDTITULAR').AsInteger,
                                    qryBenef.FieldByName('IDPESSOA').AsInteger,
                                    qryBenef.FieldByName('IDPLANOORIGEM').AsInteger,
                                    qryBenef.FieldByName('SEQPROPOSTA').AsInteger,
                                    sPercentual) then
    begin
      if sPercentual <> '' then
         dPercent := StrToFloat(sPercentual);
    end;
  end
  else
    dPercent := 100;

end;


function TfrmReaberturaData.CalculaValorDeficit: string;
var
  rVlrBaseDef    : double;
  bErro          : boolean;
  sMsgErro       : string;
  iIdCalculoAnt  : longint;
  sSQLBenefAssoc : string;
  dValorAtual    : double;
  iIdCalculo     : longInt;
begin
  Result := '';
  
  if qryBenef.FieldByName('IDREGRACALCBASEDEFICIT').AsInteger <= 0 then
     Exit;

  if reValorBS.text = '' then
  begin
    reValorDeficit.text := '';
    exit;
  end;

  // Executar regra de calculo do beneficio
  try
     sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenef.FieldByName('IDTITULAR').AsInteger);

     rVlrBaseDef    := 0;
     iIdCalculoAnt  := iIdCalculo;
     dValorAtual    := StrToFloat(reVlrTotal.text) * (dPercent / 100);

     rVlrBaseDef := ExecutaRegraCalculoDeficit(qryAux,
                                               qryBenef.FieldByName('IDREGRACALCBASEDEFICIT').AsInteger,
                                               qryBenef.FieldByName('IDPLANOPREV').AsInteger,    // iIdPlanoPrev,
                                               qryBenef.FieldByName('IDPESSJUR').AsInteger,      // iIdPessJur,
                                               qryBenef.FieldByName('IDPESSOA').AsInteger,       // iIdPessoa,
                                               qryBenef.FieldByName('IDTITULAR').AsInteger,      // iIdTitular,
                                               qryBenef.FieldByName('IDBENEFICIO').AsInteger,    // IdBeneficio
                                               bErro,
                                               sMsgErro,
                                               iIdCalculo,
                                               qryBenef.FieldByName('VALORBASE1').AsFloat,       // rOpcao1,
                                               qryBenef.FieldByName('VALORBASE3').AsFloat,       // rOpcao3,
                                               sSQLBenefAssoc,
                                               StrToFloat(reValorBS.text),
                                               qryBenef.FieldByName('VALORTOTAL').AsFloat,
                                               dValorAtual,
                                               qryBenef.FieldByName('VLRINFINSS').AsFloat,
                                               FloatToStr(dPercent),
                                               qryBenef.FieldByName('IDSITPLANOPREV').AsInteger,
                                               FormatDateTime('DD/MM/YYYY', dtReabre.date),
                                               qryBenef.FieldByName('DATAINICIOFUND').AsString,
                                               qryBenef.FieldByName('IDPLANPREVCONTAB').AsInteger
                                              );

  except
  end;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    Exit;
  end;

  if iIdCalculo = 0 then
     iIdCalculo := iIdCalculoAnt;

  Result := FloatToStr(rVlrBaseDef);
end;


procedure TfrmReaberturaData.reValorBSExit(Sender: TObject);
begin
  {calcula o valor total}
  dValorTotal := 0;
  if reValorBS.text <> '' then
     dValorTotal := StrToFloat(reValorBS.text);

  if reValorFAB.text <> '' then
     dValorTotal := dValorTotal + StrToFloat(reValorFAB.text);

  reVlrTotal.text := FloatToStr(dValorTotal);

  {limpa valor do Deficit pra calcular pela Regra}
  if (bFlgApresentaDeficit) then
     reValorDeficit.text := CalculaValorDeficit();
end;


procedure TfrmReaberturaData.reValorFABExit(Sender: TObject);
begin
  {calcula o valor total}
  dValorTotal := 0;
  if reValorBS.text <> '' then
     dValorTotal := StrToFloat(reValorBS.text);

  if reValorFAB.text <> '' then
     dValorTotal := dValorTotal + StrToFloat(reValorFAB.text);

  reVlrTotal.text := FloatToStr(dValorTotal);


  {limpa valor do Deficit pra calcular pela Regra}
  if (bFlgApresentaDeficit) then
     reValorDeficit.text := CalculaValorDeficit();

end;

procedure TfrmReaberturaData.reValorDeficitBtnClick(Sender: TObject);
begin
  inherited;

  if (bFlgApresentaDeficit) and ( ValidaDadosCalculoDeficit(tvBSFab) )then
     reValorDeficit.text := CalculaValorDeficit();

end;

function TfrmReaberturaData.ValidaDadosCalculoDeficit(
  TipoValida: TTipoValidacao): boolean;
begin
  Result := true;

  if (TipoValida = tvBSFab) or (TipoValida = tvTudo) then
  begin
    if (bFlgApresentaBSFAB) then
    begin
      if (reValorBS.Text = '') then
      begin
        MsgDlg('É necessário informar o valor do BS. ','Informação',mtInformation,[mbOk],0);
        reValorBS.SetFocus;
        Result := false;
      end;

      if (reValorFAB.Text = '') then
      begin
        MsgDlg('É necessário informar o valor do FAB.', 'Informação', mtInformation, [mbOK], 0);
        reValorFAB.SetFocus;
        Result := false;
      end;
    end;
  end;

  if (TipoValida = tvBaseDeficit) or (TipoValida = tvTudo) then
  begin
    if (bFlgApresentaDeficit) and (reValorDeficit.text = '') then
    begin
      MsgDlg('É necessário calcular o valor da base de cálculo do déficit.', 'Informação', mtInformation, [mbOK], 0);
      if reValorDeficit.Enabled then
         reValorDeficit.SetFocus;
      Result := false;
    end;
  end;

  if (TipoValida = tvTudo) and (reVlrTotal.text = '') then
  begin
    if (bTemFuncef) then
       MsgDlg('É necessário preencher o Valor Total.', 'Informação', mtInformation, [mbOK], 0)
    else
       MsgDlg('É necessário preencher o Valor Total INSS.', 'Informação', mtInformation, [mbOK], 0);
    if reVlrTotal.Enabled then
       reVlrTotal.SetFocus;
    Result := false;
  end;

end;


procedure TfrmReaberturaData.dtReabreExit(Sender: TObject);
begin
  inherited;
  BuscaPercentual;
end;


procedure TfrmReaberturaData.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ModalResult <> mrCancel then
  begin
    if bErroMensagem then
       CanClose := False;
  end;
end;


end.
