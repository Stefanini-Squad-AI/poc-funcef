unit CRelAlugueisEventos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, StdCtrls, ExtCtrls, Mask, wwdbedit, Wwdbspin, wwdblook, Db,
  DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, fcCombo, fcColorCombo, MontaSelect, uModuloImobiliario;

type
  TcfgRelAlugueisEventos = class(TcfgRel)
    Label1: TLabel;
    Label3: TLabel;
    DBspnAno: TwwDBSpinEdit;
    rdgVigencia: TRadioGroup;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    edtAdminImovel: TEdit;
    Label6: TLabel;
    btnBuscaAdminImovel: TBitBtn;
    btnLimpaAdminImovel: TBitBtn;
    chkLinhas: TCheckBox;
    rdgOrdena: TRadioGroup;
    edtImovelMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;

    procedure FormShow(Sender: TObject);
    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);
    procedure btnBuscaImovelMestreClick(Sender: TObject);


  private { Private declarations }
    iAdminImovel  : integer;
    iImovelMestre : integer;

    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelAlugueisEventos: TcfgRelAlugueisEventos;



implementation
{$R *.DFM}
Uses
   uSistema, uDiasInUteis, uData, dRelAdminImob, dLookImobiliario,
  DMS;



procedure TcfgRelAlugueisEventos.MontaQuery;
begin
   with dtmRelAdminImob do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         dtmRelAdminImob.ppLogoEventos.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         dtmRelAdminImob.ppLogoEventos.Picture := nil;

      rptAlugueisEventos_lblAno.Caption := FormatFloat('0000', DBspnAno.Value);

      if length(trim(edtAdminImovel.Text)) > 0 then begin
         rptAlugueisEventos_lblAdministradora.Caption := edtAdminImovel.Text;
      end else begin
         rptAlugueisEventos_lblAdministradora.Caption := '< Todas >';
      end;

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
      CorAtual    := clWhite;

      iAnoAlugueisEventos := word(trunc(DBspnAno.Value));

      with qryAlugueisEventos do begin

         SQL.Text :=
         'SELECT ' + #13 +

         '   IM.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, ' + #13 +
         '   C.IDCONTRATOIMOVEL, ' + #13 +
         '   C.CONNUMERO, C.CONNOME, C.IDLOCATARIO, ' + #13 +

         '   C.CONDATAINICIO, C.CONDATAFIM, C.CONDATACARENCIA, ' + #13 +
         '   C.CONDATADENUNCIA, C.CONDATAAVDENUNCIA, ' + #13 +
         '   C.CONDATAREAJUSTE, C.CONPROXREAJUSTE, ' + #13 +
         '   C.CONDATARENEGOC, C.CONDATAAVRENEGOC, ' + #13 +
         '   C.CONDATAFIANCAFIM, C.CONDATAFIANCAAV, ' + #13 +

         '   PL.RAZAOSOCIAL AS LOCATARIO_RS, PL.NOME AS LOCATARIO_NF, ' + #13 +
         '   PA.RAZAOSOCIAL AS ADMINISTRADORA_RS, PA.NOME AS ADMINISTRADORA_NF ' + #13 +

         'FROM ' + #13 +
         '   PESSOA PL, PESSOA PA,' + #13 +
         '   CONTRATOIMOVEL C, ' + #13 +

         '   ( ' + #13 +
         '   SELECT ' + #13 +
         '      IM.IDIMOVELMESTRE, IM.IDIMOVEL, CX.IDCONTRATOIMOVEL, IM.IMONOME ' + #13 +
         '   FROM ' + #13 +
         '      CONTRATOXIMOVEL CX, IMOVEL I, IMOVEL IM ' + #13 +
         '   WHERE ' + #13 +
         '      ( CX.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
         '      AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) ' + #13 +
         '   GROUP BY ' + #13 +
         '      IM.IDIMOVELMESTRE, IM.IDIMOVEL, CX.IDCONTRATOIMOVEL, IM.IMONOME ' + #13 +
         '   ) IM ' + #13 +

         'WHERE ' + #13 +
         '   ( C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ' + #13;

         if edtImovelMestre.Text <> '' then
         SQL.Text := SQL.Text +
         '   AND ( IM.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) ' + #13;

         if edtAdminImovel.Text <> '' then
         SQL.Text := SQL.Text +
         '   AND ( C.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) ' + #13;

         if rdgVigencia.ItemIndex = 0 then
         SQL.Text := SQL.Text +
         '   AND ( ' + #13 +
         '   ( C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'') ) OR ' + #13 +
         '   ( C.FLGINDETERMINADO = ''S'' ) ) ' + #13;

         SQL.Text := SQL.Text +
         '   AND ( C.IDLOCATARIO = PL.IDPESSOA(+) ) ' + #13 +
         '   AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) ) ' + #13 +
         '   AND ( C.IDCONTRATOIMOVEL  = IM.IDCONTRATOIMOVEL ) ' + #13 +

         'ORDER BY ' + #13 +
         '   IM.IMONOME, ' + #13;

         Case rdgOrdena.ItemIndex of
            0: SQL.Text := SQL.Text + '   C.CONNUMERO, C.CONNOME ';
            1: SQL.Text := SQL.Text + '   C.CONNOME, C.CONNUMERO ';
         end;

      end;

   end;
end;



procedure TcfgRelAlugueisEventos.FormShow(Sender: TObject);
begin
   inherited;

   iAdminImovel   := -1;
   iImovelMestre  := -1;

   DBspnAno.Value := DiasInUteis.ExtraiAno(Date);
end;



procedure TcfgRelAlugueisEventos.btnBuscaAdminImovelClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_AdminImovel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_AdminImovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iAdminImovel         := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
      edtAdminImovel.Text  := dtmMS.MS_AdminImovel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaAdminImovel.SetFocus;
end;



procedure TcfgRelAlugueisEventos.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelAlugueisEventos.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;



procedure TcfgRelAlugueisEventos.btnBuscaImovelMestreClick(Sender: TObject);
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



end.
