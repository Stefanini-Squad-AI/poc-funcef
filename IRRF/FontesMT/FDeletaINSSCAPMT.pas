unit FDeletaINSSCAPMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ExtCtrls, wwdblook, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, DBClient, uCMClientDataSet, uCtrlDeletaINSSCAP,
  uCtrlNatuRendimento;

type
  TfrmDeletaINSSCAPMT = class(TfrmSairAjuda)
    bbtnConfirmaGeracao: TBitBtn;
    gbPeriodo: TGroupBox;
    Label4: TLabel;
    edtDataInicio: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    lblNatRendimento: TLabel;
    DBcboNatureza: TwwDBLookupCombo;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;

    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmaGeracaoClick(Sender: TObject);


  private // Private declarations

    CtrlDeletaINSSCAP : TCtrlDeletaINSSCAP;
    CtrlNaturendimento : TCtrlNatuRendimento;

    function VerificaPreenchimento: Boolean;


  public  // Public declarations


  end;



var
  frmDeletaINSSCAPMT: TfrmDeletaINSSCAPMT;



implementation
{$R *.DFM}
uses
  uVerificaPreenchimento, uMensErro, uDataBase,  dbaseDados, uSistema, dLookIRRF;



procedure TfrmDeletaINSSCAPMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlDeletaINSSCAP   := TCtrlDeletaINSSCAP.Create;
  CtrlNaturendimento  := TCtrlNatuRendimento.Create;

  CtrlDeletaINSSCAP.Initialize(dtmBaseDados.dbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True,
                               nil,
                               nil,
                               False
                              );

  CtrlNaturendimento.InitializeAs(CtrlDeletaINSSCAP);

  dtmLookIRRF.cdsLookNatureza.Data := CtrlNaturendimento.ListNaturendimento_Filtrada;
end;



procedure TfrmDeletaINSSCAPMT.bbtnConfirmaGeracaoClick(Sender: TObject);
var
  sMsg : string;
begin
  inherited;

  // -----------------------------------------------------------------------------------------------

  if not(VerificaPreenchimento) then Exit;

  sMsg := 'Deseja realmente apagar a geração do INSS para o período selecionado?';

  if not(MsgDlg(sMsg, Sistema.NomeModulo, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then Exit;

  Repaint;

  // -----------------------------------------------------------------------------------------------

  if not(CtrlDeletaINSSCAP.DeletaLancINSSCAP(edtDataInicio.Date,
                                             edtDataFim.Date,
                                             DBcboNatureza.LookupValue
                                            )) then
  begin
    MsgDlg(CtrlDeletaINSSCAP.MessageInfo, Sistema.NomeModulo, mtError, [mbOk], 0);
    Repaint;
  end
  else
  begin
    MsgDlg('Busca Desfeita.', Sistema.NomeModulo, mtInformation, [mbOk], 0);
    Repaint;
  end;

  // -----------------------------------------------------------------------------------------------
end;



function TfrmDeletaINSSCAPMT.VerificaPreenchimento: Boolean;
begin
  Result := False;

  try
    if length(trim(edtDataInicio.Text)) = 0 then
      raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataInicio);

    if length(trim(edtDataFim.Text)) = 0 then
      raise EValidacao.CreateVal('É necessário indicar a Data Final!', edtDataFim);

    if edtDataFim.Date < edtDataInicio.Date then
      raise EValidacao.CreateVal('A Data Final não pode ser anterior à Data Inicial!', edtDataInicio);

  except
    on ev : EValidacao do
    begin
      if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
			Repaint;
      ev.Control.SetFocus;
      Exit;
    end;

  end;

  Result := True;
end;



end.
