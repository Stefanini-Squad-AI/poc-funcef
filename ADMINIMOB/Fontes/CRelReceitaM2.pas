{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q+,R+,S-,T+,U+,V+,W+,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
Pendências  : 25051
Responsável : Gustavo Mendes
Data        : 02/10/2007
Descrição   : Implementação de filtros de Locatario e Segmento
-------------------------------------------------------------------------------}

unit CRelReceitaM2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, fcCombo,
  fcColorCombo, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, uModuloImobiliario,
  Mask, wwdbedit, Wwdbspin, mImovelMestre, mLocatario;

type
  TcfgRelReceitaM2 = class(TcfgRel)
    chkArea: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    Bevel3: TBevel;
    molImovelMestre1: TmolImovelMestre;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    molLocatario1: TmolLocatario;
    Label8: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;

    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);

  private { Private declarations }
    function VerificaPreenchimento: boolean;
    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelReceitaM2: TcfgRelReceitaM2;



implementation
{$R *.DFM}
Uses
   uSistema, uMensErro, UComunsImobiliario, uVerificaPreenchimento, dRelAdminImob, uFuncoesImob, dImobiliario,
   dLookImobiliario, DMS;



function TcfgRelReceitaM2.VerificaPreenchimento: boolean;
begin
  Result := False;
  try
     if length(trim(cboMesCompetencia.Text)) = 0 then
        raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMesCompetencia);
     if length(trim(DBspnAnoCompetencia.Text)) = 0 then
        raise EValidacao.CreateVal('É necessário indicar o Ano de Competência!', DBspnAnoCompetencia);
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



procedure TcfgRelReceitaM2.MontaQuery;
begin
   with dtmRelAdminImob do begin

      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
           dtmRelAdminImob.ppLogoReceitaM2.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else dtmRelAdminImob.ppLogoReceitaM2.Picture := nil;


      // preenche a competencia
      rptReceitaM2_lblCompetencia.Caption := ComunsImobiliario.Competencia(cboMesCompetencia.ItemIndex +1,
                                                                           DBspnAnoCompetencia.Value);

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bSeparador  := chkLinhas.Checked;
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

      with qryReceitaM2 do begin
         LimpaParametros(qryReceitaM2);
         ParamByName('PIDPESSOA').asInteger  := Sistema.idEmpresa;
         ParamByName('PMESCOMPETENCIA').asInteger := cboMesCompetencia.ItemIndex +1;
         ParamByName('PANOCOMPETENCIA').asInteger := StrToInt(FormatFloat('####',DBspnAnoCompetencia.Value));
         if molImovelMestre1.iMestre > 0  then ParamByName('PIDIMOVELMESTRE').asInteger := molImovelMestre1.iMestre;
         if molLocatario1.iLocatario > 0  then ParamByName('PIDFORCLI').asInteger := molLocatario1.iLocatario;//Gustavo Mendes - 25051
         if DBcboTipoImovel.LookupValue <> '' then ParamByName('PCODTIPOIMOVEL').AsString := DBcboTipoImovel.LookupValue;//Gustavo Mendes - 25051




         if chkArea.Checked    then ParamByName('PFLGAREA').asString := 'S';
      end;
   end;
end;



procedure TcfgRelReceitaM2.FormShow(Sender: TObject);
begin
   inherited;
   cboMesCompetencia.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value   := DiasUteis.ExtraiAno(Date);
//Gustavo Mendes 25051 - Adicionando
   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;
end;


procedure TcfgRelReceitaM2.bbtnConfirmarClick(Sender: TObject);
begin
  if VerificaPreenchimento then inherited;
end;



end.
