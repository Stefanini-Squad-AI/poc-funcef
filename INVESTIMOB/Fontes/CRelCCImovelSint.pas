unit CRelCCImovelSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, wwdblook, ExtCtrls, Db, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TcfgRelCCImovelSint = class(TcfgRel)
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edtDataContabil: TCMDateTimePicker;
    lblImovelouMestre: TLabel;
    btnBuscaImovelMestre: TBitBtn;
    edtImovelouMestre: TEdit;
    btnLimpaImovelMestre: TBitBtn;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);



  private { Private declarations }
    iImovelMestre : integer;
    iImovel       : integer;

    function VerificaPreenchimento: boolean;
    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelCCImovelSint: TcfgRelCCImovelSint;



implementation
{$R *.DFM}
Uses
   uSistema, uDiasInUteis, uData, uMensErro, uComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobContab, uFuncoesImob, dLookImobiliario, DMS;




function TcfgRelCCImovelSint.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if iImovelMestre = -1 then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel Mestre!', btnBuscaImovelMestre);

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



procedure TcfgRelCCImovelSint.MontaQuery;
begin
   dtmRelAdminImobContab.rptCCImovelSint_lblDataContabil.Caption := FormatDateTime('DD/MM/YYYY', edtDataContabil.Date);

   with dtmRelAdminImobContab.qryCCImovelSint do begin
      LimpaParametros(dtmRelAdminImobContab.qryCCImovelSint);

      ParamByName('PIDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('PDATAMOV').asDateTime  := edtDataContabil.Date;

      if iImovelMestre > 0 then  ParamByName('PIDIMOVELMESTRE').asInteger   := iImovelMestre;
      if iImovel > 0 then        ParamByName('PIDIMOVEL').asInteger         := iImovel;

      Open;
   end;
end;



procedure TcfgRelCCImovelSint.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelCCImovelSint.FormShow(Sender: TObject);
begin
   inherited;

   edtDataContabil.Date := DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(Date, -1)),
                           DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(Date, -1)));

   iImovelMestre  := -1;
   iImovel        := -1;
end;



procedure TcfgRelCCImovelSint.btnBuscaImovelMestreClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_ImovelouMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelouMestre.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      if dtmMS.MS_ImovelouMestre.ValoresChave[9] = '1' then begin

         iImovelMestre              := StrToInt(dtmMS.MS_ImovelouMestre.ValoresChave[0]);
         iImovel                    := StrToInt(dtmMS.MS_ImovelouMestre.ValoresChave[1]);
         lblImovelouMestre.Caption  := 'Imóvel';
         edtImovelouMestre.Text     := dtmMS.MS_ImovelouMestre.ValoresChave[2] + ' - ' +
                                       dtmMS.MS_ImovelouMestre.ValoresChave[3];
      end else begin

         lblImovelouMestre.Caption  := 'Imóvel Mestre';

         iImovelMestre              := StrToInt(dtmMS.MS_ImovelouMestre.ValoresChave[0]);
         iImovel                    := -1;
         edtImovelouMestre.Text     := dtmMS.MS_ImovelouMestre.ValoresChave[2];

      end;

      Screen.Cursor := crDefault;
   end;

   btnBuscaImovelMestre.SetFocus;
end;



procedure TcfgRelCCImovelSint.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   lblImovelouMestre.Caption  := 'Imóvel Mestre e/ou Imóvel';

   iImovelMestre  := -1;
   iImovel        := -1;

   edtImovelouMestre.Clear;
end;



end.
