// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 23.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FBaixaContribPIDPIA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, checklst,  Spin, Db,
  DBTables, Wwquery, ComCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmBaixaContribPIDPIA = class(TfrmOkCancelar)
    Panel1: TPanel;
    StaticText1: TStaticText;
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    chkApenas13: TCheckBox;
    GroupBox1: TGroupBox;
    dtRecebimento: TCMDateTimePicker;
    PageControl1: TPageControl;
    tbsBasico: TTabSheet;
    tbsResultado: TTabSheet;
    Panel2: TPanel;
    lbPatro: TLabel;
    chklstPatro: TCheckListBox;
    Label7: TLabel;
    chklstPlano: TCheckListBox;
    lbParticipante: TLabel;
    chklstSituacao: TCheckListBox;
    Panel3: TPanel;
    bbtnEnviar: TBitBtn;
    bbtnDesfazer: TBitBtn;
    memResult: TMemo;
    bbtnSalvar: TBitBtn;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryAux: TwwQuery;

    procedure bbtnEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private // Private declarations


  public  // Public declarations


  end;



var
  frmBaixaContribPIDPIA: TfrmBaixaContribPIDPIA;



implementation
{$R *.DFM}
uses
  UMensErro, UDataBase, UAdmPrev, DBaseDados, USistema;




procedure TfrmBaixaContribPIDPIA.bbtnEnviarClick(Sender: TObject);
Var
 sSQL, StrMesCob : String;
 StrPlano, StrPatro, StrTipo : String;
 I:Integer;
begin
  inherited;

   // TESTAR INFORMAÇÕES OBRIGATÓRIAS
   if Trim(cmbMesCob.Text) = ''
   then begin
     MsgDlg('Mês de Cobrança não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cmbMesCob.SetFocus;
     Exit;
   end;

   if Trim(spedAnoCob.Text) = ''
   then begin
     MsgDlg('Ano de Cobrança não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     spedAnoCob.SetFocus;
     Exit;
   end;

   if Trim(dtRecebimento.Text) = ''
   then begin
     MsgDlg('Data de Recebimento não preenchida. ','Erro',mtError,[mbOk,mbHelp],0);
     spedAnoCob.SetFocus;
     Exit;
   end;

// Patrocinadora
  StrPatro := '';
  For I := 0 To (chklstPatro.Items.Count-1) do Begin
    If (chklstPatro.Checked[I] = True) Then Begin
      If QryPatro.Locate('NOME',chklstPatro.Items[I],[]) Then Begin
        StrPatro := StrPatro + QryPatro.FieldByName('IDPESSOA').AsString+', ';
      End;
    End;
  End;

// Marcar todas caso nao tenha marcado nenhuma
  If StrPatro = '' Then Begin
    For I := 0 To (chklstPatro.Items.Count-1) do Begin
      If QryPatro.Locate('NOME',chklstPatro.Items[I],[]) Then Begin
        StrPatro := StrPatro + QryPatro.FieldByName('IDPESSOA').AsString+', ';
      End;
    End;
  End;

// Acerta String de Patrocinadoras
  StrPatro := Copy(Trim(StrPatro),1,(Length(Trim(StrPatro))-1) );

// Plano
  StrPlano := '';
  For I := 0 To (chklstPlano.Items.Count-1) do Begin
    If (chklstPlano.Checked[I] = True) Then Begin
      If QryPlano.Locate('NOME',chklstPlano.Items[I],[]) Then Begin
        StrPlano := StrPlano + QryPlano.FieldByName('IDPLANOPREV').AsString+', ';
      End;
    End;
  End;

// Marcar todas caso nao tenha marcado nenhuma
  If StrPlano = '' Then Begin
    For I := 0 To (chklstPlano.Items.Count-1) do Begin
      If QryPlano.Locate('NOME',chklstPlano.Items[I],[]) Then Begin
        StrPlano := StrPlano + QryPlano.FieldByName('IDPLANOPREV').AsString+', ';
      End;
    End;
  End;

// Acerta String de Patrocinadoras
  StrPlano := Copy(Trim(StrPlano),1,(Length(Trim(StrPlano))-1) );

// Tipos
   StrTipo := '';
   If chklstSituacao.Checked[0] = True Then StrTipo := StrTipo + '''7'', ';
   If chklstSituacao.Checked[1] = True Then StrTipo := StrTipo + '''6'', ';
   If StrTipo = '' Then Begin
     StrTipo := '''7'','+'''6'', ' ;
   End;

// Acerta String de Patrocinadoras
   StrTipo := Copy(Trim(StrTipo),1,(Length(Trim(StrTipo))-1) );

   If Not dtmBaseDados.dbBaseDados.InTransaction Then
     dtmBaseDados.dbBaseDados.StartTransaction;

   If cmbMesCob.ItemIndex+1 <= 9 Then
     StrMesCob := spedAnoCob.Text+'/0'+IntToStr(cmbMesCob.ItemIndex+1)
   Else
     StrMesCob := spedAnoCob.Text+'/'+IntToStr(cmbMesCob.ItemIndex+1);
   sSQL :=
             'UPDATE HSTCONTRIBPREV SET           '+
             'VALORRECEBIDO   = VALORESPERADO,    '+
             'SITRECEBIMENTO  = ''2'' ,           '+
             'DATARECEBIMENTO = TO_DATE('''+dtRecebimento.text+''',''DD/MM/YYYY'') '+
             'WHERE MESCOBRANCA = '+ QuotedStr(StrMesCob) +' '  +
             'AND IDPESSJUR IN ('+StrPatro+')            '+
             'AND IDPLANOPREV IN ('+StrPlano+')          '+
             'AND IDPESSOA IN                                       '+
             '    ( SELECT EL.IDPESSOA                              '+
             '      FROM ELEGPATRO EL, SITFUNC SF                   '+
             '      WHERE EL.IDPESSJUR IN ('+StrPatro+') '+
             '      AND  EL.IDSITFUNC = SF.IDSITFUNC                '+
             '      AND SF.FLGINTERNO IN ('+StrTipo+')  ) ';

    With qryAux do  begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      Try
        ExecSQL;
      Except
        On E:EDBEngineError do begin
          MostrarErro(E);
          dtmBaseDados.dbBaseDados.Rollback;
          Exit;
         End;
      End;
    End;

    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
    dtmBaseDados.dbBaseDados.Commit;
end;

procedure TfrmBaixaContribPIDPIA.FormShow(Sender: TObject);
begin
  inherited;


// Tira Visibilidade Botoes

  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible := False;
  bbtnDesfazer.Visible := False;
  bbtnSalvar.Visible := False;


// Preenche Listas de Opcoes

// Patrocinadoras
  With QryPatro Do
  Begin
    Close;
    ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
    Open;
    While Not EOF Do Begin
// Adiciona Texto e o Identificador no Objeto.
      chklstPatro.Items.Add(FieldByName('NOME').AsString);
      Next; // proximo Registro
    End;
  End;

// Plano
  With QryPlano Do Begin
    Close;
    ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
    Open;
    While Not EOF Do Begin
// Adiciona Texto e o Identificador no Objeto.
      chklstPLano.Items.Add(FieldByName('NOME').AsString);
      Next; // proximo Registro
    End;
  End;
end;



end.