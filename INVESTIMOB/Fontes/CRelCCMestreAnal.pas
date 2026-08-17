unit CRelCCMestreAnal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, wwdblook, ExtCtrls, Db, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TcfgRelCCMestreAnal = class(TcfgRel)
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    edtDataContabil: TCMDateTimePicker;
    edtImovelMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);


  private { Private declarations }
    iImovelMestre : integer;

    function VerificaPreenchimento: boolean;
    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelCCMestreAnal: TcfgRelCCMestreAnal;



implementation
{$R *.DFM}
Uses
   uSistema, uDiasInUteis, uData, uMensErro, uComunsImobiliario, uVerificaPreenchimento, 
   dRelAdminImobContab, uFuncoesImob, dLookImobiliario, DMS;



function TcfgRelCCMestreAnal.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if length(trim(edtDataContabil.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de referência!', edtDataContabil);

	except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

	Result := True;
end;



procedure TcfgRelCCMestreAnal.MontaQuery;
begin
   dtmRelAdminImobContab.rptCCMestreAnal_lblDataContabil.Caption := FormatDateTime('DD/MM/YYYY', edtDataContabil.Date);

   with dtmRelAdminImobContab.qryCCMestreAnal do begin

      LimpaParametros(dtmRelAdminImobContab.qryCCMestreAnal);

      ParamByName('PDATAMOV').asDateTime  := edtDataContabil.Date;
      ParamByName('PIDPESSOA').asInteger  := Sistema.idEmpresa;

      if iImovelMestre > 0 then  ParamByName('PIDIMOVELMESTRE').asInteger  := iImovelMestre;

      Open;
   end;
end;



procedure TcfgRelCCMestreAnal.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelCCMestreAnal.FormShow(Sender: TObject);
begin
   inherited;

   edtDataContabil.Date := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(Date, -1)),
                           DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(Date, -1)));

   iImovelMestre  := -1;
end;



procedure TcfgRelCCMestreAnal.btnBuscaImovelMestreClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_ImovelMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelMestre.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovelMestre        := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
      edtImovelMestre.Text := dtmMS.MS_ImovelMestre.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaImovelMestre.SetFocus;
end;



procedure TcfgRelCCMestreAnal.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;



end.
