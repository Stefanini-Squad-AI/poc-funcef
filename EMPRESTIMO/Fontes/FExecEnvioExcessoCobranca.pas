{

*****************************************************************************
***************************** REGISTRO DE ALTERAÇÕES ************************
*****************************************************************************
SIG         : SIG TIBERO
Autor(a)    : Everson Luiz Pereira da Cunha
Data        : 25/10/2018
Alteração   : Alteração no Owner da tabela CONTRATOAD
//------------------------------------------------------------------------------
SIG         : 45184
Autor(a)    : André Imakawa
Data        : 04/05/2017
Alteração   : Ajuste na rotina para tratar os itens de emprestimos que tiveram
              excesso de débito na Folha Funcef
//------------------------------------------------------------------------------
Autor(a)    : Peterson Victor
Data        : 24/09/2015
Alteração   : Alteracao da querie de tratamento de excesso de debito
SOL         : 262123
PPM         : 1082745
//------------------------------------------------------------------------------
Autor(a)    : Marcio Sanches Spinosa
Data        : 11/05/2012
Alteração   : Tratamento de excesso de débitos
SOL         : 168737
KINTANA     : 1491532
//------------------------------------------------------------------------------

}


unit FExecEnvioExcessoCobranca;

interface

uses
   Windows, Messages, Classes, Graphics, Controls,
   StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, fcButton,
   fcImgBtn, fcShapeBtn, wwdbdatetimepicker, CMDateTimePicker, Mask,
   wwdbedit, Wwdbspin, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, CheckLst, Db, DBTables,
   mPatro, mContratoEmptmo, FSairAjudaImob, Wwquery, TREdit,UFuncoesEmptmo,
   uTypesEmptmo, Forms, mListaPlano, mListaPatro;

type
   TfrmExecEnvioExcessoCobranca = class(TfrmSairAjudaImob)
      lblTitulo: TfcLabel;
    nbPrincipal: TNotebook;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    chkVerificaCobrancaAtraso: TCheckBox;
    pnl1: TPanel;
    lbl5: TLabel;
    DBspnAno: TwwDBSpinEdit;
    cbbMes: TComboBox;
    DBcboTipoEmptmo: TwwDBLookupCombo;
    DBcboTipoContrato: TwwDBLookupCombo;
    btnContinuar: TfcShapeBtn;
    molContratoEmptmo: TmolContratoEmptmo;
    chkIntegraCaR: TCheckBox;
    molListaPatro: TmolListaPatro;
    molListaPlano: TmolListaPlano;
    grpDataVencto: TGroupBox;
    edtDataVenctoIni: TwwDBDateTimePicker;
    chkInArquivo: TCheckBox;
    chkNotInArquivo: TCheckBox;
    bvl1: TBevel;
    lblTotal: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    btnVoltar: TfcShapeBtn;
    mmoResult: TMemo;
    edtNumResult: TRealEdit;
    edtVlrTotParcela: TRealEdit;
    mmoErro: TMemo;
    edtNumErro: TRealEdit;
    pnl2: TPanel;
    pnl3: TPanel;
    rgNovoDestino: TRadioGroup;
    wwQuery1: TwwQuery;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure btnContinuarClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);
      procedure nbPrincipalPageChanged(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure chkInArquivoClick(Sender: TObject);
      procedure chkNotInArquivoClick(Sender: TObject);


   private  // Private declarations

//====================================================
// Private Functions
//====================================================

      function MontaCorpoSelect(pStrContrato : double; pMes : string; pAno : string; pTipoEmprestimo : string) : string;
      function MontaUpdate(pStrContrato : string; pStrIdHist : string) : string;
      function PegaMes : String;
      function ValidaCampos : Boolean;
      function atualizarContrato(pStrContrato : string; pStrIdHist : string) : Boolean;
//====================================================
// Private Procedures
//====================================================
      procedure AbreQueries;
      procedure InstanciaObjetos;
      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;
      procedure InicializaFiltros;
      procedure ConfiguraFolhaPatrocinadora;
      procedure ConfiguraFolhaBeneficio;
      procedure ConfiguraFinanceiroReceber;

   public   // Public declarations

      pQry                  : TwwQuery;
      pQryUpdate            : TwwQuery;
      pAno                  : string;
      pStrHMEFORMACOBRANCA  : string;
      pStrHMETIPOFOLHA      : string;
      pStrHMEDATAVENCTO     : string;
   end;



var
  frmExecEnvioExcessoCobranca: TfrmExecEnvioExcessoCobranca;



implementation
{$R *.DFM}
uses
   Dialogs, SysUtils, USistema, UDataBase, UMensErro, FProgresso, dBaseDados,
   uModulo, uVerificaPreenchimento, DLookEmptmo, dMS, uIntegraEmptmo, DEmptmo, uDiasUteis,
   UCalcEmptmo;


//=====================================================================
// Habilita botões
//=====================================================================

procedure TfrmExecEnvioExcessoCobranca.HabilitaBotoes;
begin
   btnContinuar.Enabled := True;
   btnVoltar.Enabled    := True;
   bbtnSair.Enabled     := True;
   Screen.Cursor        := crDefault;
   nbPrincipal.Enabled  := True;
end;

//=====================================================================
// Desabilita botões
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   nbPrincipal.Enabled := False;

   btnContinuar.Enabled := False;
   btnVoltar.Enabled    := False;
   bbtnSair.Enabled     := False;
end;


//=====================================================================
// Abre Queries
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;

   // SitPart
   LimpaParametros(dtmLookEmptmo.qryLookSitPart);
   dtmLookEmptmo.qryLookSitPart.Open;

   with dtmLookEmptmo.qryLookPortadorFormaR do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaR);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
end;

//=====================================================================
// Form Show
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.FormShow(Sender: TObject);
var Mes : String;
begin
   inherited;

   ParametrosSistema;

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);

   chkVerificaCobrancaAtraso.Checked := dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1;

   DBspnAno.Text := FormatDateTime('YYYY', Now);

   Mes := formatdatetime('mm', Now);
   cbbMes.ItemIndex := StrToInt(Mes) - 1;


end;


procedure TfrmExecEnvioExcessoCobranca.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;

//=====================================================================
// Botão Continuar
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.btnContinuarClick(Sender: TObject);
var pStrMes : string;
    pStrAno : string;
    dDataIni : TDateTime;
begin

   try
    try
   if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;

      ParametrosSistema;

      DesabilitaBotoes;

      (* limpa os memos de resultado e erro *)
      mmoResult.Clear;
      mmoErro.Clear;

      dDataIni := Now;
      mmoResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDataIni));
      mmoResult.Lines.Add(' ');

      mmoResult.Lines.Add(' ');
      mmoResult.Lines.Add('           Nº Contrato     Matrícula     Plano Patro Parcela  Item                   Valor        ');
      mmoResult.Lines.Add('           --------------- ------------- ----- ----- ------- ----------------------- ------------ ');


      if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

      // -------------------------------------------------------------------------------------------
      //    Atualização da Forma de Envio (pela Situação do Participante)
      // -------------------------------------------------------------------------------------------

      if (DBspnAno.Text = '0') then
        pStrAno := EmptyStr
      else
        pStrAno := DBspnAno.Text;

     if ValidaCampos then
     begin
        pQry.Close;
        pQry.SQL.Clear;
        pQry.SQL.Add(MontaCorpoSelect(molContratoEmptmo.IdContrato, PegaMes, pStrAno, DBcboTipoEmptmo.LookupValue));
        pQry.Open;

        PQRY.First;

       if not (pQry.IsEmpty) then
       begin

         case rgNovoDestino.ItemIndex of
           0 : ConfiguraFolhaPatrocinadora;
           1 : ConfiguraFolhaBeneficio;
           2 : ConfiguraFinanceiroReceber;
         end;

         PQRY.First;

         while not pqry.Eof do
         begin
            if (atualizarContrato(pQry.FieldByName('IDCONTRATOEMPTMO').AsString, pQry.FieldByName('IDHISTMOVEMPTMO').AsString)) then
            begin
               mmoResult.Lines.Add(' ');
               //Print no resultado formatado conforme cabeçalho
               mmoResult.Lines.Add(#9 + CompletaInicio(FormatFloat('#0', pQry.fieldbyname('IDCONTRATOEMPTMO').AsFloat), ' ', 15) + ' ' +
                        CompletaFim(pQry.fieldbyname('MATRICULA').AsString, ' ', 13) + ' ' +
                        CompletaFim(pQry.FieldByName('PLANO').Asstring, ' ', 5) + ' ' +
                        CompletaFim(FormatFloat(#0, pQry.FieldByName('IDPATRO').AsFloat), ' ', 5) + ' ' +
                        CompletaInicio(FormatFloat('#0', pQry.FieldByName('HMEPARCELA').AsFloat), ' ', 7) + ' ' +
                        CompletaFim(pQry.FieldByName('ITEM').Asstring , ' ', 21) + ' ' +
                        CompletaInicio(FormatCurr('R$ ###,##0.00', pQry.fieldbyname('HMEVLRPREVISTO').AsCurrency), ' ', 14)+ ' '
                       );
               pQry.Next;
            end;
         end;
       end;

        CommitTransacao;

        // vai para página de Resultados
        nbPrincipal.PageIndex := 1;
        Repaint;


     end;

        HabilitaBotoes;

    except
     RollBackTransacao;
    end;
   finally

      mmoResult.Lines.Add(' ');
      mmoResult.Lines.Add('Final do Processo      : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      mmoResult.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));
   end;

end;


//=====================================================================
// Botão Voltar
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.btnVoltarClick(Sender: TObject);
begin
   inherited;
   nbPrincipal.PageIndex := 0;
end;

//=====================================================================
// Alterar Aba
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.nbPrincipalPageChanged(Sender: TObject);
begin
   inherited;
   EscondeEspera;
end;

//=====================================================================
// Form Create
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.FormCreate(Sender: TObject);
begin
   inherited;
   ParametrosSistema;
   InstanciaObjetos;

end;

//=====================================================================
// Form Close
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   UFuncoesEmptmo.bBuscaMutuario := false;
   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      molContratoEmptmo.Filtro := '';
   end;

   inherited;
end;

//=====================================================================
// Inverter Seleção Patrocinadores
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;

//=====================================================================
// Marcar Todos Patrocinadores
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;

//=====================================================================
// Inverter Seleção Planos
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;

//=====================================================================
// Marcar Todos os planos
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;

//=====================================================================
// Buscar contratos
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);

   chkInArquivo.Enabled    := (molContratoEmptmo.IDContrato <= 0);
   chkNotInArquivo.Enabled := (molContratoEmptmo.IDContrato <= 0);

   if (chkInArquivo.Checked) then chkInArquivo.Checked     := (molContratoEmptmo.IDContrato <= 0);
   if chkNotInArquivo.Checked then chkNotInArquivo.Checked := (molContratoEmptmo.IDContrato <= 0);

end;



procedure TfrmExecEnvioExcessoCobranca.molContratoEmptmobtnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnLimpaContratoClick(Sender);
  chkInArquivo.Enabled   := (molContratoEmptmo.IDContrato <= 0);
  chkNotInArquivo.Enabled := (molContratoEmptmo.IDContrato <= 0);
end;

//=====================================================================
// Liberar CheckBox
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.chkInArquivoClick(Sender: TObject);
begin
  inherited;

  if chkInArquivo.Checked = true and chkNotInArquivo.Checked = true then
  begin
    chkNotInArquivo.Checked := false;
  end;

end;

//=====================================================================
// Liberar CheckBox
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.chkNotInArquivoClick(Sender: TObject);
begin
  inherited;

  if chkInArquivo.Checked = true and chkNotInArquivo.Checked = true then
  begin
    chkInArquivo.Checked := false;
  end;

end;

//=====================================================================
// Monta Corpo Select
//=====================================================================
function TfrmExecEnvioExcessoCobranca.MontaCorpoSelect( pStrContrato: double;
                                                        pMes : string;
                                                        pAno : string;
                                                        pTipoEmprestimo : string): string;
  var sSql            : string;
      pStrPatroc      : string;
      pStrPlano       : string;
      i               : integer;
begin
 try
  // SOL 262123 PPM 1082745 inicio comentario

 {
   sSql := sSql + 'SELECT H.IDHISTMOVEMPTMO,  H.IDCONTRATOEMPTMO, H.HMEMESCOBRANCA, H.HMEANOCOBRANCA, HMETIPOFOLHA, ' +
                  ' DT.MATRICULA, H.IDPATRO, H.HMEPARCELA, H.iditememptmo, I.ITEDESCRICAO AS ITEM, H.HMEVLRPREVISTO,   ' +
                  ' TCE.TCEDESCRICAO, CE.IDPLANOPREV, PP.NOME AS PLANO, PATR.NOME AS PATRO  ' +
                  ' FROM TMPDESC T ' +
                  ' INNER JOIN HISTMOVEMPTMO H ON (H.IDTMPDESC = T.IDTMPDESC) '+
                  ' INNER JOIN PESSOAFISICA PF ON (PF.IDPESSOA = T.IDPESSOA) '+
                  ' INNER JOIN CONTRATOEMPTMO CE ON (CE.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO) '+
                  ' INNER JOIN TIPOCONTREMPTMO TCE ON (CE.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO) ' +
                  ' INNER JOIN DEPENTIT DT ON (DT.IDPESSOA = PF.IDPESSOA AND DT.IDTITULAR = CE.IDPESSOA AND DT.IDPESSOA = CE.IDBENEF) ' +
                  ' INNER JOIN Planprev pp ON pp.idplanoprev = ce.idplanoprev '+
                  ' INNER JOIN ITEMEMPTMO I ON I.IDITEMEMPTMO = H.IDITEMEMPTMO '+
                  ' INNER JOIN PESSOA PATR ON PATR.IDPESSOA = CE.IDPATRO '+
                  ' WHERE T.SITENVIO = ''1'' ' +
                  ' AND H.HMEFORMACOBRANCA = ''F'' ' +
                  ' AND PF.DATAMORTE IS NULL  '+
                  ' AND H.IDTMPDESC IS NOT NULL '+
                  ' AND H.HMETIPOMOV = 1 ' +
                  ' AND H.HMECENTRALIZA + H.HMEDESTACADO = 1 ' +
                  ' AND T.VALORRECEBIDO = 0 ' +
		  ' AND T.DATARECEBIMENTO IS NOT NULL ' +
		  ' AND H.HMEVLRPREVISTO > 0 ' +
                  ' AND NVL(H.FLGESTORNADO, 0) = 0 ';

   if (pStrContrato > 0 ) then
      sSql := sSql + ' AND H.IDCONTRATOEMPTMO = ' + QuotedStr(FloatToStr(pStrContrato));

   if (pMes <> EmptyStr) then
      sSql := sSql + ' AND H.HMEMESCOBRANCA =  ' + pMes;

   if (pAno <> EmptyStr) then
      sSql := sSql + ' AND H.HMEANOCOBRANCA =  ' + pAno;

   if (pTipoEmprestimo <> EmptyStr) then
      SSql := SSql + ' AND TCE.IDTIPOEMPTMO = ' + pTipoEmprestimo;

   for i := 0 to high(molListaPatro.vIDPatro) do
   begin
      if molListaPatro.lstPatro.Checked[i] then
      begin
        if (pStrPatroc = EmptyStr) then
          pStrPatroc := FloatToStr(molListaPatro.vIDPatro[i])
        else
          pStrPatroc := pStrPatroc + ', ' + FloatToStr(molListaPatro.vIDPatro[i]);
      end;
   end;

   if (pStrPatroc <> EmptyStr) then
      SSql := SSql + ' AND CE.IDPATRO IN ( ' + pStrPatroc + ') ';

   for i := 0 to High(molListaPlano.vIDPlano) do
   begin
     IF (molListaPlano.lstPlano.Checked[i]) then
     begin
       if (pStrPlano = EmptyStr) then
          pStrPlano := FloatToStr(molListaPlano.vIDPlano[i])
       else
          pStrPlano := pStrPlano + ', ' + FloatToStr(molListaPlano.vIDPlano[i]);
     end;
   end;

   if (pStrPatroc <> EmptyStr) then
      SSql := SSql + ' AND CE.IDPLANOPREV IN ( ' + pStrPlano + ') ';


   if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
      SSql := SSql +   '  AND H.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;

   if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
      SSql := SSql +    '  AND H.IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;
   }
  // SOL 262123 PPM 1082745 fim comentario

  // SOL 262123 PPM 1082745 inicio nova query
   sSql := sSql + ' SELECT H.IDHISTMOVEMPTMO, H.IDCONTRATOEMPTMO, TO_NUMBER(TO_CHAR(H.DATAVENCTO, ''MM'')) AS HMEMESCOBRANCA, ' +
                  ' TO_NUMBER(TO_CHAR(H.DATAVENCTO, ''YYYY'')) AS HMEANOCOBRANCA, H.TIPOFOLHA AS HMETIPOFOLHA, H.VLRPREVISTO as HMEVLRPREVISTO, ' +
                  ' DT.MATRICULA, CE.IDPATRO, H.PARCELA AS HMEPARCELA, H.IDITEMEMPTMO, I.ITEDESCRICAO AS ITEM, ' +
                  ' H.VLRPREVISTO, TCE.TCEDESCRICAO, CE.IDPLANOPREV, PP.NOME AS PLANO, PATR.NOME AS PATRO ' +
                  ' FROM HMEPRESTACAO H ' +
                  ' INNER JOIN CONTRATOEMPTMO CE ON CE.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO ' +
                  ' INNER JOIN TIPOCONTREMPTMO TCE ON CE.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO ' +
                  ' INNER JOIN DEPENTIT DT ON DT.IDTITULAR = CE.IDPESSOA AND DT.IDPESSOA = CE.IDBENEF ' +
                  ' INNER JOIN PESSOAFISICA PF ON PF.IDPESSOA = DT.IDPESSOA ' +
                  ' INNER JOIN PLANPREV PP ON PP.IDPLANOPREV = CE.IDPLANOPREV ' +
                  ' INNER JOIN ITEMEMPTMO I ON I.IDITEMEMPTMO = H.IDITEMEMPTMO ' +
                  ' INNER JOIN PESSOA PATR ON PATR.IDPESSOA = CE.IDPATRO ' +
                  ' WHERE H.FORMACOBRANCA = ''F'' ' +
                  ' AND PF.DATAMORTE IS NULL ' +
                  ' AND H.NATUREZAITEM > 0 ' +
                  ' AND H.VLRPREVISTO > 0 ' +
                  ' AND H.FLGQUITABONOESTORNO <> 3 ';

   if (pStrContrato > 0 ) then
      sSql := sSql + ' AND H.IDCONTRATOEMPTMO = ' + QuotedStr(FloatToStr(pStrContrato));

   if (pTipoEmprestimo <> EmptyStr) then
      SSql := SSql + ' AND TCE.IDTIPOEMPTMO = ' + pTipoEmprestimo;

   if (pMes <> EmptyStr) then
      sSql := sSql +  ' AND TO_NUMBER(TO_CHAR(H.DATAVENCTO, ''MM'')) = ' + pMes;

   if (pAno <> EmptyStr) then
      sSql := sSql +  ' AND TO_NUMBER(TO_CHAR(H.DATAVENCTO, ''YYYY'')) = ' + pAno;

   for i := 0 to high(molListaPatro.vIDPatro) do
   begin
      if molListaPatro.lstPatro.Checked[i] then
      begin
        if (pStrPatroc = EmptyStr) then
          pStrPatroc := FloatToStr(molListaPatro.vIDPatro[i])
        else
          pStrPatroc := pStrPatroc + ', ' + FloatToStr(molListaPatro.vIDPatro[i]);
      end;
   end;

   if (pStrPatroc <> EmptyStr) then
      SSql := SSql + ' AND CE.IDPATRO IN ( ' + pStrPatroc + ') ';

   for i := 0 to High(molListaPlano.vIDPlano) do
   begin
     IF (molListaPlano.lstPlano.Checked[i]) then
     begin
       if (pStrPlano = EmptyStr) then
          pStrPlano := FloatToStr(molListaPlano.vIDPlano[i])
       else
          pStrPlano := pStrPlano + ', ' + FloatToStr(molListaPlano.vIDPlano[i]);
     end;
   end;

   if (pStrPatroc <> EmptyStr) then
      SSql := SSql + ' AND CE.IDPLANOPREV IN ( ' + pStrPlano + ') ';

   SSql := SSql + ' AND H.IDHISTMOVEMPTMO IN (SELECT HE.IDHISTMOVEMPTMO ' +
                  '                           FROM HMEENVIO HE ' +
                  '                           WHERE HE.IDTMPDESC IN ' +
                  '                                (SELECT T.IDTMPDESC ' +
                  '                                 FROM TMPDESC T ' +
                  '                                 WHERE T.SITENVIO = ''1'' ' +
                  '                                       AND T.IDMODULO = ' + IntToStr(Sistema.IdModulo);

   if (pAno <> EmptyStr) and
      (pMes <> EmptyStr) then
      SSql := SSql + ' AND T.MESCOBRANCA = ' + Chr(39) + pAno + '/' + pMes + Chr(39) ;

   // Andre Imakawa - SIG 45184 - Incio
   {
   SSql := SSql +   '  AND T.VALORRECEBIDO = 0 ' +
                    '  AND T.DATARECEBIMENTO IS NOT NULL)) ';
   }
   SSql := SSql +   'AND ((T.VALORRECEBIDO = 0 AND' + #13#10 +
                    '      T.DATARECEBIMENTO IS NOT NULL) OR' + #13#10 +
                    '     (T.VALORRECEBIDO IS NULL AND' + #13#10 +
                    '      T.DATARECEBIMENTO IS NULL))))';

    // Andre Imakawa - SIG 45184 - Fim

   if (chkInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
//      SSql := SSql +   '  AND H.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '        + #13;   //Everson Luiz - TIBERO
      SSql := SSql +   '  AND H.IDCONTRATOEMPTMO       IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '        + #13;        //Everson Luiz - TIBERO

   if (chkNotInArquivo.Checked) and (molContratoEmptmo.IDContrato <= 0) then
//      SSql := SSql +    '  AND H.IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CARGA.CONTRATOAD) '    + #13;  //Everson Luiz - TIBERO
      SSql := SSql +    '  AND H.IDCONTRATOEMPTMO       NOT IN (SELECT IDCONTRATOEMPTMO FROM CM.CONTRATOAD) '    + #13;       //Everson Luiz - TIBERO

   // SOL 262123 PPM 1082745 fim nova query

   Result := sSql;
 except
   on E : Exception do
   begin
     ShowMessage(e.Message);
   end;
 end;
end;

//=====================================================================
// Instancia Objetos
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.InstanciaObjetos;
begin
  try
    if not Assigned(pQry) then
    begin
       pQry := TwwQuery.Create(nil);
       pQry.DatabaseName := 'BaseDados';
       pQry.SQL.Clear;
    end;

    if not Assigned(pQryUpdate) then
    begin
       pQryUpdate := TwwQuery.Create(nil);
       pQryUpdate.DatabaseName := 'BaseDados';
       pQryUpdate.SQL.Clear;

    end;

  except
    on E: Exception do
    begin
      ShowMessage(e.message);
    end;
  end;
end;

//=====================================================================
// Pega mes
//=====================================================================
function TfrmExecEnvioExcessoCobranca.PegaMes: String;
var pMes : string;
begin
   inherited;
   
   pMes := EmptyStr;

   if(cbbMes.ItemIndex >= 0) then
   begin
     pMes := IntToStr(cbbMes.ItemIndex + 1);

     if length(pMes) = 1 then
        pMes := '0' + pMes;
   end;

   Result := pMes;
end;

//=====================================================================
// Valida Campos
//=====================================================================
function TfrmExecEnvioExcessoCobranca.ValidaCampos: Boolean;
var isValidaCampo  : boolean;
begin
   isValidaCampo := True;

   if (rgNovoDestino.ItemIndex = -1) then
   begin
      ShowMessage('É necessário escolher um destino !');
      isValidaCampo := False;
      Exit;
   end;

   if (Trim(edtDataVenctoIni.Text) = EmptyStr) then
   begin
      ShowMessage('É necessário escolher uma data de vencimento!');
      isValidaCampo := False;
      Exit;
   end;

   Result := isValidaCampo;
end;

//=====================================================================
// Configurar Filtros do Update
//=====================================================================
procedure TfrmExecEnvioExcessoCobranca.ConfiguraFinanceiroReceber;
begin
  pStrHMEFORMACOBRANCA := 'C';
  pStrHMETIPOFOLHA     := 'NULL';
  pStrHMEDATAVENCTO    := edtDataVenctoIni.Text;
end;

procedure TfrmExecEnvioExcessoCobranca.ConfiguraFolhaBeneficio;
begin
  pStrHMEFORMACOBRANCA := 'F';
  pStrHMETIPOFOLHA     := 'B';
  pStrHMEDATAVENCTO    := edtDataVenctoIni.Text;
end;

procedure TfrmExecEnvioExcessoCobranca.ConfiguraFolhaPatrocinadora;
begin
  pStrHMEFORMACOBRANCA := 'C';
  pStrHMETIPOFOLHA     := 'P';
  pStrHMEDATAVENCTO    := edtDataVenctoIni.Text;
end;

procedure TfrmExecEnvioExcessoCobranca.InicializaFiltros;
begin
  pStrHMEFORMACOBRANCA := EmptyStr;
  pStrHMETIPOFOLHA     := EmptyStr;
  pStrHMEDATAVENCTO    := EmptyStr;
end;

//=====================================================================
// Atualiza Contrato
//=====================================================================
function TfrmExecEnvioExcessoCobranca.atualizarContrato(pStrContrato : string; pStrIdHist : string): Boolean;
begin
  try
     InstanciaObjetos;
     pQryUpdate.Close;
     pQryUpdate.SQL.Clear;
     pQryUpdate.sql.Add(MontaUpdate(pStrContrato, pStrIdHist));
     pQryUpdate.ExecSQL;

     result := True;
  except
    on e : Exception do
    begin
      ShowMessage(e.Message);
      Result := False;
    end;
  end;
end;

//=====================================================================
// Monta Update
//=====================================================================
function TfrmExecEnvioExcessoCobranca.MontaUpdate(pStrContrato : string; pStrIdHist : string): string;
var sSql : string;
begin
 sSql := ' UPDATE HISTMOVEMPTMO SET HMEFORMACOBRANCA = ' + QuotedStr(pStrHMEFORMACOBRANCA) + ' , ' ;

   if (Length(pStrHMETIPOFOLHA) > 1) then
     sSql := sSql + ' HMETIPOFOLHA = ' + pStrHMETIPOFOLHA + ' , '
   else
     sSql := sSql + ' HMETIPOFOLHA = ' + QuotedStr(pStrHMETIPOFOLHA) + ' , ' ;

  sSql := sSql +' IDTMPDESC = NULL , ' +
         ' FLGENVIO = 0, ' +
         ' HMEDATAVENCTO = ' + QuotedStr(pStrHMEDATAVENCTO) + ' WHERE IDCONTRATOEMPTMO = ' + QuotedStr(pStrContrato) +
         ' AND IDHISTMOVEMPTMO = ' + QuotedStr(pStrIdHist);

 Result := sSql;
end;

end.
1
