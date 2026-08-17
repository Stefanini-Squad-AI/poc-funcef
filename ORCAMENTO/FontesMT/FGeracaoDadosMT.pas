unit FGeracaoDadosMT;
{  --------------------------------------------------------------------------------------------------
// Alterações....: Inclusão do parâmetro chkValidacaoFDO.Checked
// Rotina........: ExecutaGeracaoDados
// Autor.........: William Santana
// Data..........: 20/08/2013
// Nº SOL........: 204073
// Nº KINTANA....: 1974951
// Descrição.....: Evolução no processo de Geração de Dados.
--------------------------------------------------------------------------------------------------
// Alterações:
// Rotina........: *.DFM, Diversas (mudança de modulo.iPlanoOrc para iIdPlanoOrc)
// Autor.........: Edilaine Ferraresi
// Data..........: 19/03/2012
// Nº SOL........: 172383-7764
// Nº KINTANA....: 1556975
// Descrição.....: Adicionado parâmetro de Plano orçamentario
---------------------------------------------------------------------------------------------------}
//========================================================================================
//  Data      : 31/07/2006
//  Pendência : 22283
//  Autor     : Rodolpho da Silva
//  Descrição : Criação da tela de geração de dados
//
//========================================================================================
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Mask, wwdbedit, Wwdbspin,
  uCtrlGeraDados, uCtrlPadroes, uSistema, uModulo, wwdblook, uMensErro,
  FProgressoDuplo, uDiasUteis, Db, DBClient, uCMClientDataSet,uIntegraBack,
  uCmSqlParams, CMDBLookupCombo;

type
  TFrmGeracaoDadosMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    cboPerIni: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cboPerFim: TComboBox;
    reExercicio: TDBRealEdit;
    Label3: TLabel;
    Panel2: TPanel;
    rgTipoCalculo: TRadioGroup;
    chkCalculaSaldoAnterior: TCheckBox;
    rgCalcContaxGrupo: TRadioGroup;
    Panel3: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    spPosIni: TwwDBSpinEdit;
    spQtdDigitos: TwwDBSpinEdit;
    Label8: TLabel;
    edConteudo: TEdit;
    lbConteudo: TLabel;
    Panel4: TPanel;
    mmErros: TMemo;
    cboCenario: TwwDBLookupCombo;
    CdsCenarios: TCMClientDataSet;
    rgModoCalculo: TRadioGroup;
    chkCommit: TCheckBox;
    Label5: TLabel;
    cdsPlanoOrc: TCMClientDataSet;
    cboPlanoOrc: TCMDBLookupCombo;
    chkValidacaoFDO: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edConteudoChange(Sender: TObject);
    procedure rgCalcContaxGrupoClick(Sender: TObject);
    procedure rgModoCalculoClick(Sender: TObject);
    procedure cboPlanoOrcChange(Sender: TObject);
    procedure chkValidacaoFDOClick(Sender: TObject);
    procedure rgTipoCalculoClick(Sender: TObject);        //William Santana SOL 204073 KIN 1974951
  private
    { Private declarations }
    CtrlGeraDados: TCtrlGeraDados;
    iIdPlanoOrc : integer;    // Edilaine - SOL 172383-7764 / KTN 1556975

  public
    { Public declarations }
    procedure Progresso(vParam: array of Variant);

  end;



  
var
  FrmGeracaoDadosMT: TFrmGeracaoDadosMT;

implementation

{$R *.DFM}




procedure TFrmGeracaoDadosMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGeraDados := TCtrlGeraDados.Create;
  CtrlGeraDados.InitializeAs(Padroes);

  CtrlGeraDados.Progresso := Progresso;
  reExercicio.Value       := DiasUteis.ExtraiAno(Date);
  cboPerIni.ItemIndex     := 0;
  cboPerFim.ItemIndex     := (DiasUteis.ExtraiMes(Date) - 1);
  CdsCenarios.Data        := CtrlGeraDados.ListaCenarios;
  spPosIni.Value          := 1;
  
  // Edilaine Ferraresi - SOL 172383-7764 / KTN 1556975
  iIdPlanoOrc      := -1;
  cdsPlanoOrc.Data := CtrlGeraDados.ListaPlanoOrcamento;
end;




procedure TFrmGeracaoDadosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlGeraDados);
  inherited;
end;
                                  

procedure TFrmGeracaoDadosMT.bbtnConfirmarClick(Sender: TObject);
var
  iIdCenario: integer;
  dInicio,dTempoDuracao: TDateTime;
  wHoras,wMinutos,wSegundos,wMilesimos: Word;


begin
  inherited;
  if (cboPerIni.ItemIndex > cboPerFim.ItemIndex) then
  begin
    MsgDlg('O período inicial não pode ser maior que o período final!','Aviso',mtWarning,[mbOk],0);
    Exit;
  end;

  // Edilaine - SOL 172383-7764 / KTN 1556975
  if (cboPlanoOrc.Text = '') then
  begin
    MsgDlg('Obrigatório o preenchimento do Plano Orçamentário','Aviso',mtWarning,[mbOk],0);
    cboPlanoOrc.setfocus;
    Exit;
  end;
  // Edilaine - SOL 172383-7764 / KTN 1556975 - fim

  if Trim(cboCenario.Text) <> '' then
     iIdCenario := StrToInt(cboCenario.LookupValue)
  else
     iIdCenario := -1;

  dInicio := Now;
  if not CtrlGeraDados.ExecutaGeracaoDados(Sistema.IdEmpresa,  //iIdEmpresa
                                           iIdPlanoOrc, {Modulo.iPlanoOrc,} //iIdPlanoOrc   // Edilaine - SOL 172383-7764 / KTN 1556975
                                           IntegraBack.Plano,   //iIdPlanoContab
                                           Trunc(reExercicio.Value), //iExercicio
                                          (cboPerIni.ItemIndex + 1), //iPerIni
                                          (cboPerFim.ItemIndex + 1),  //iPerFim
                                           iIdCenario,                //iIdCenario
                                           rgTipoCalculo.ItemIndex,   //iTipoGer
                                           Trunc(spPosIni.Value),     //iPosIni
                                           Trunc(spQtdDigitos.Value), //iQtdDigitos
                                           Trim(edConteudo.Text),       //sConteudo
                                           (rgModoCalculo.ItemIndex = 1),  //bCalculaPeriodo
                                           chkCalculaSaldoAnterior.Checked,  //bCalculaSaldoAnterior
                                           (rgCalcContaxGrupo.ItemIndex = 1), //bCalculaPorGrupo
                                           chkCommit.Checked,                 //bCommitar
                                           chkValidacaoFDO.Checked) then   //bValidacaoFDO  //William Santana - SOL: 204073 KIN: 1974951
  begin
    
     MsgDlg('Houve um erro ao executar a geração de dados. ' + #13 +
            'Mensagem: ' + CtrlGeraDados.MessageInfo,'Erro',mtError,[mbOK],0);


     if not(chkValidacaoFDO.Checked) then
     bbtnConfirmar.Enabled := False;
  end
  else
  begin
     dTempoDuracao := (Now - dInicio);
     DecodeTime(dTempoDuracao,wHoras,wMinutos,wSegundos,wMilesimos);

     //William Santana - SOL: 204073 KIN: 1974951
     if (chkValidacaoFDO.Checked) then
      begin
       mmErros.Lines.Clear;
       if CtrlGeraDados.sLog6 <> '' then
       begin
        mmErros.Lines.Add(CtrlGeraDados.sLog6);
        mmErros.Lines.SaveToFile('C:\PLANUS\TEMP\Validação de Valores Realizados - FDO_'+FormatDateTime('yyyy-mm-dd hh-nn-ss', Now)+'.txt');
       end;
      end;


     if CtrlGeraDados.sLog6 = '' then
     begin
     //END - William Santana - SOL: 204073 KIN: 1974951
     MsgDlg('Processo concluído com sucesso!' + #13 + #13 +
            'Início: '  + FormatDateTime('dd/mm/yyyy hh:nn:ss',dInicio) + #13 +
            'Término: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',Now)     + #13 +
            'Duração: ' + IntToStr(wHoras) + ' hora(s), ' + IntToStr(wMinutos) + ' minuto(s) e ' + IntToStr(wSegundos) + ' segundo(s)',
            'Aviso',mtInformation,[mbOk],0);
     end;
     {     MsgDlg('Processo concluído com sucesso!' + #13 + #13 +
            'Início: '  + FormatDateTime('dd/mm/yyyy hh:nn:ss',dInicio) + #13 +
            'Término: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',Now)     + #13 +
            'Duração: ' + IntToStr(wHoras) + ' hora(s), ' + IntToStr(wMinutos) + ' minuto(s) e ' + IntToStr(wSegundos) + ' segundo(s)',
            'Aviso',mtInformation,[mbOk],0);
      }


     //END - William Santana - SOL: 204073 KIN: 1974951

  end;
end;




procedure TFrmGeracaoDadosMT.Progresso(vParam: array of Variant);
//  0: (1-mostra;2-anda;3-esconde;4-Mensagem para o memo)
//
//  1: Legenda - Acima
//  2: Min.- Acima
//  3: Máx.- Acima
//  4: Posição - Acima
//
//  5: Legenda - Abaixo
//  6: Min.- Abaixo
//  7: Máx.- Abaixo
//  8: Posição - Abaixo

begin

   case vParam[0] of
      // Progresso Duplo
      1: begin
            frmProgressoDuplo.Min  := 1;
            frmProgressoDuplo.Min2 := 1;
            frmProgressoDuplo.Max  := 100;
            frmProgressoDuplo.Max2 := 100;
            frmProgressoDuplo.Pos  := 1;
            frmProgressoDuplo.Pos2 := 1;
            frmProgressoDuplo.MostraFormProgressoDuplo(vParam[1],vParam[5],vParam[2],vParam[6],vParam[3],vParam[7],False,False);
         end;

      2: begin
            frmProgressoDuplo.Max  := vParam[3];
            frmProgressoDuplo.Max2 := vParam[7];
            frmProgressoDuplo.Min  := vParam[2];
            frmProgressoDuplo.Min2 := vParam[6];

            if Trim(vParam[1]) <> '' then
               frmProgressoDuplo.Legenda := vParam[1];

            if Trim(vParam[5]) <> '' then
               frmProgressoDuplo.Legenda2 := vParam[5];

            frmProgressoDuplo.AndaFormProgressoDuplo(vParam[4],vParam[8]);
         end;

      3: frmProgressoDuplo.EscondeFormProgressoDuplo;
      4: begin
            mmErros.Lines.Add('--------------------------------------------------------');
            mmErros.Lines.Add(vParam[1]);
            mmErros.Lines.Add('');
         end;
         
   end;


   Application.ProcessMessages;
   Repaint;
end;




procedure TFrmGeracaoDadosMT.edConteudoChange(Sender: TObject);
begin
  inherited;
  spQtdDigitos.Value := Trunc(edConteudo.GetTextLen);
end;




procedure TFrmGeracaoDadosMT.rgCalcContaxGrupoClick(Sender: TObject);
begin
  inherited;
  case rgCalcContaxGrupo.ItemIndex of
    0: lbConteudo.Caption := 'Conta Orçamentária';
    1: lbConteudo.Caption := 'Grupo Orçamentário';
  end;
end;




procedure TFrmGeracaoDadosMT.rgModoCalculoClick(Sender: TObject);
begin
  inherited;
  case rgModoCalculo.ItemIndex of
    0: chkCommit.Caption := 'Commitar a cada dia processado';
    1: chkCommit.Caption := 'Commitar a cada período processado';
  end;
end;

procedure TFrmGeracaoDadosMT.cboPlanoOrcChange(Sender: TObject);
begin
  inherited;
  // Edilaine Ferraresi - SOL 172383-7764 / KTN 1556975
  iIdPlanoOrc := -1;
  if (cboPlanoOrc.text <> '') then
  begin
    if cboPlanoOrc.LookUpValue <> '' then
       iIdPlanoOrc := StrToInt( cboPlanoOrc.LookUpValue );
    reExercicio.Text := cdsPlanoOrc.FieldByName('Ano').AsString;
  end;
  // Edilaine Ferraresi - SOL 172383-7764 / KTN 1556975 - fim
end;

//William Santana SOL 204073 KIN 1974951
procedure TFrmGeracaoDadosMT.chkValidacaoFDOClick(Sender: TObject);
begin
  inherited;
  if chkValidacaoFDO.Checked then
  begin
    chkCalculaSaldoAnterior.Checked := False;
    chkCalculaSaldoAnterior.Enabled := False;
    if rgTipoCalculo.ItemIndex = 0 then
     rgTipoCalculo.ItemIndex := 1;
  end
  else
    chkCalculaSaldoAnterior.Enabled := True;
    rgTipoCalculo.Controls[0].Enabled := True;
end;

procedure TFrmGeracaoDadosMT.rgTipoCalculoClick(Sender: TObject);
begin
  inherited;
   if (chkValidacaoFDO.Checked) and (rgTipoCalculo.ItemIndex = 0) then
   begin
     rgTipoCalculo.ItemIndex := 1;
     rgTipoCalculo.Controls[0].Enabled := False;
   end;

end;
//END - William Santana SOL 204073 KIN 1974951

end.
