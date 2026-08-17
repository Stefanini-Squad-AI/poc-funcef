{
--------------------------------------------------------------------------------

              TELA DE RELATÓRIO PARA HISTÓRICO DE VIDA ÚTIL

              Módulo          :  Comuns Imobiliário
              Autor           :  Helio Lima Custodio
              Data de Término :  08/04/2014

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit RHistoricoVidaUtil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, Wwdatsrc, DBTables, Wwquery,
  Grids, Wwdbigrd, Wwdbgrid, Mask, wwdblook, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, FSairAjudaImob, uCMClientDataSet;

type
  TfrmRelHistoricoVidaUtil = class(TfrmSairAjudaImob)
    Label3: TLabel;
    btnBuscaImovel: TBitBtn;
    edtImovel: TEdit;
    DBGrd: TwwDBGrid;
    Bevel1: TBevel;
    qryHistoricoVidaUtil: TwwQuery;
    qryHistoricoVidaUtilVIDAUTIL: TFloatField;
    qryHistoricoVidaUtilTXDEP_ANO: TFloatField;
    qryHistoricoVidaUtilTXDEP_MES: TFloatField;
    qryHistoricoVidaUtilVIGENTE: TStringField;
    qryHistoricoVidaUtilTRGDTINCLUSAO: TDateTimeField;
    qryHistoricoVidaUtilNOMEUSUARIO: TStringField;
    qryHistoricoVidaUtilHistVidaUtil: TStringField;
    qryHistoricoVidaUtilHIST_EVENTO: TStringField;
    dsHistoricoVidaUtil: TwwDataSource;

    procedure btnBuscaImovelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private { Private declarations }
   iImovel  : integer;

  public { Public declarations }

  end;



var
  frmRelHistoricoVidaUtil: TfrmRelHistoricoVidaUtil;



implementation
{$R *.DFM}
uses
  uSistema, uMensErro, uDatabase, dBaseDados, uComunsImobiliario, uVerificaPreenchimento,
  dLookImobiliario, uDocumento, uIntegraBack, FCadastroCS, uAtivoFixo, uFuncoesImob, DMS,
  uModuloImobiliario;


procedure TfrmRelHistoricoVidaUtil.btnBuscaImovelClick(Sender: TObject);
begin

   qryHistoricoVidaUtil.Close;
   
   dtmMS.MS_Imovel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Imovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovel        := StrToInt(dtmMS.MS_Imovel.ValoresChave[1]);
      edtImovel.Text := dtmMS.MS_Imovel.ValoresChave[2] + ' - ' +
                        dtmMS.MS_Imovel.ValoresChave[3];


      Screen.Cursor := crDefault;

      LimpaParametros(qryHistoricoVidaUtil);
      qryHistoricoVidaUtil.ParamByName('PIDIMOVEL').asInteger  := iImovel;
      qryHistoricoVidaUtil.Open;
   end;

   if btnBuscaImovel.CanFocus then btnBuscaImovel.SetFocus;
end;


procedure TfrmRelHistoricoVidaUtil.FormShow(Sender: TObject);
begin
  inherited;
  qryHistoricoVidaUtil.Close;
end;



end.
