//------------------------------------------------------------------------------
// ALTERAÇÕES :
//------------------------------------------------------------------------------
// Pendência  :
// Autor      : Daniel Simões
// Data       : 16/02/2006
// Descrição  : Adicionado o filtro que pega apenas os valores dos alugéis dos
//              imóveis dentro da vigência do contrato (qryContratosAdminAnal) ...
//------------------------------------------------------------------------------

unit CRelQuadroImoveis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, fcCombo,
  fcColorCombo, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, uModuloImobiliario;

type
  TcfgRelQuadroImoveis = class(TcfgRel)
    Label1: TLabel;
    chkCusto: TCheckBox;
    chkArea: TCheckBox;
    chkAluguel: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    Bevel3: TBevel;
    edtImovelMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;
    chkDesconto: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);


  private { Private declarations }
    iImovelMestre : integer;

    function VerificaPreenchimento: boolean;
    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelQuadroImoveis: TcfgRelQuadroImoveis;



implementation
{$R *.DFM}
Uses
   uSistema, uMensErro, UComunsImobiliario, uVerificaPreenchimento, dRelAdminImob, uFuncoesImob, dImobiliario,
   dLookImobiliario, DMS;



function TcfgRelQuadroImoveis.VerificaPreenchimento: boolean;
begin
  Result := False;
  try
//     if length(trim(edtDataContabil.Text)) = 0 then
//     raise EValidacao.CreateVal('É necessário indicar a Data de referência!', edtDataContabil);
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



procedure TcfgRelQuadroImoveis.MontaQuery;
begin
   with dtmRelAdminImob do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         dtmRelAdminImob.ppLogoQuadroAluguel.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         dtmRelAdminImob.ppLogoQuadroAluguel.Picture := nil;

      // preenche a data do custo contábil
//      rptQuadroImoveis_lblDataContabil.Caption := FormatDateTime('DD/MM/YYYY', edtDataContabil.Date);

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bSeparador  := chkLinhas.Checked;
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      with qryQuadroImoveis do begin
         LimpaParametros(qryQuadroImoveis);

         ParamByName('PIDPESSOA').asInteger  := Sistema.idEmpresa;
         if iImovelMestre > 0  then ParamByName('PIDIMOVELMESTRE').asInteger := iImovelMestre;
         if chkArea.Checked    then ParamByName('PFLGAREA').asString := 'S';
         if chkAluguel.Checked then ParamByName('PFLGALUG').asString := 'S';
      end;
   end;
end;



procedure TcfgRelQuadroImoveis.bbtnConfirmarClick(Sender: TObject);
begin
  if VerificaPreenchimento then inherited;
end;



procedure TcfgRelQuadroImoveis.btnBuscaImovelMestreClick(Sender: TObject);
begin
   inherited;
   dtmMS.MS_ImovelMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelMestre.RetornouValor then begin
      iImovelMestre        := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
      edtImovelMestre.Text := dtmMS.MS_ImovelMestre.ValoresChave[1];
      Screen.Cursor := crDefault;
   end;
   btnBuscaImovelMestre.SetFocus;
end;



procedure TcfgRelQuadroImoveis.btnLimpaImovelMestreClick(Sender: TObject);
begin
  inherited;
  iImovelMestre := -1;
  edtImovelMestre.Clear;
end;


end.
