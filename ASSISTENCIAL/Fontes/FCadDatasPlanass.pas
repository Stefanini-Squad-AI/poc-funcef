unit FCadDatasPlanass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, Wwdatsrc,
  DBTables, Wwquery, ComCtrls, Spin, MontaSelect, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, ImgList;

const
    iTamSitPart = 7;
    vetNomeSitPart : array[1..iTamSitPart] of string =
                  ('Patrocinadora','Ativo', 'Assistido','Mantido','Mantido Parcial','Manutenção de Saldo de Conta','Cancelado');
    vetCodSitPart : array[1..iTamSitPart] of string[2] =
                  ('PT','AT','AS','MA','MP','MS','CA');
type
  TfrmCadDatasPlanass = class(TfrmOkCancelar)
    qryPlanPatro: TwwQuery;
    dsPlanPatro: TwwDataSource;
    pnlLeft: TPanel;
    StaticText2: TStaticText;
    stxtPatro: TStaticText;
    pnlRight: TPanel;
    trvPlanos: TTreeView;
    imGrupos: TImageList;
    pnlNormal: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    spedNormal: TSpinEdit;
    rgrpUtilNormal: TRadioGroup;
    rgrpAntNormal: TRadioGroup;
    stxtDatas: TStaticText;
    pnlAtraso: TPanel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    spedAtraso: TSpinEdit;
    rgrpUtilAtraso: TRadioGroup;
    rgrpAntAtraso: TRadioGroup;
    pnlDevol: TPanel;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    spedDevolucao: TSpinEdit;
    rgrpUtilDevolucao: TRadioGroup;
    rgrpAntDevolucao: TRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    qryDatas: TwwQuery;
    lstAuxTipo: TListBox;
    qryAux: TwwQuery;
    rgrpMesNormal: TRadioGroup;
    rgrpMesAtraso: TRadioGroup;
    rgrpMesDevolucao: TRadioGroup;
    bbtnProcurar: TBitBtn;
    MontaSel: TMontaSelect;
    qrypatro: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure trvPlanosCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure trvPlanosExpanded(Sender: TObject; Node: TTreeNode);
    procedure trvPlanosExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure trvPlanosChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
    liIdPatro : integer;
    bValidado : boolean;
    procedure MontaTree;
    procedure PreencheDatas;
    procedure LimpaDatas;
    procedure ValidaDatasPatro;
    procedure GravaDatas;
  public
    { Public declarations }
  end;

var
  frmCadDatasPlanass: TfrmCadDatasPlanass;
  Primeiro : boolean ;
  pIdPessJur,
  pIdPlanoPrev, pIdplanass : integer;

implementation

uses UAdmAss, UMensErro;

{$R *.DFM}

procedure TfrmCadDatasPlanass.MontaTree;
var i : integer;
    tUltItem,
    tUltPlano : TTreeNode;
begin
   trvPlanos.Items.Clear;
   lstAuxTipo.Clear;
   qryPlanPatro.First;
   while not qryPlanPatro.Eof do
   begin
      // Adicionar Plano na Arvore
      tUltPlano := trvPlanos.Items.Add(nil,qryPlanPatro.FieldByName('Nome').AsString);
      lstAuxTipo.Items.Add('PL');
      // Adicionar situacoes
      for i := 1 to iTamSitPart do
      begin
         tUltItem := trvPlanos.Items.AddChild(tUltPlano,vetNomeSitPart[i]);
         lstAuxTipo.Items.Add(vetCodSitPart[i]);
         tUltItem.ImageIndex := 2;
         tUltItem.SelectedIndex := 2;
      end;
      qryPlanPatro.Next;
   end;
end;//MontaTree

procedure TfrmCadDatasPlanass.PreencheDatas;
var
    iItem : integer;
    iSitSelecionada,
    iPlanoSelecionado : integer;
    sPlanoSelecionado,
    sNomeSitSelecionada,
    sIdSitSelecionada,
    pIdSitPart   : string;
begin
   iItem := trvPlanos.Selected.AbsoluteIndex;

   if iItem < 0 // não tem nenhum item selecionado
   then begin
      Exit;
   end;
     
   // Se o usuario clicar no plano -> sair
   if lstAuxTipo.Items[iItem] = 'PL'
   then begin
     LimpaDatas;
     bbtnConfirmar.Enabled := False;
     bbtnCancelar.Enabled := False;
     Exit;
   end;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;

   iSitSelecionada := iItem;
   sIdSitSelecionada := lstAuxTipo.Items[iSitSelecionada];
   sNomeSitSelecionada := trvPlanos.Items.Item[iSitSelecionada].Text;

   if trvPlanos.Selected.AbsoluteIndex < 0
   then iPlanoSelecionado := 1
   else iPlanoSelecionado := trvPlanos.Selected.Parent.AbsoluteIndex;
   sPlanoSelecionado := trvPlanos.Items.Item[iPlanoSelecionado].Text;

   if lstAuxTipo.Items[iItem] = 'PT'
   then stxtDatas.Caption := sPlanoSelecionado + ' - Datas da Patrocinadora '
   else stxtDatas.Caption := sPlanoSelecionado + ' - '+sNomeSitSelecionada;

   // Preencher Parametros
   //pIdPessJur := liIdPatro;
   if qryPlanPatro.Locate('Nome',sPlanoSelecionado,[loCaseInsensitive,loPartialKey])
   then pIdPlanass := qryPlanPatro.FieldByName('IdPlanass').AsInteger
   else pIdPlanass := -1;
   pIdSitPart := sIdSitSelecionada;

   qryDatas.Close;
   qryDatas.ParamByName('IdPessJur').AsInteger := pIdPessJur;
   qryDatas.ParamByName('IdPlanoPrev').AsInteger := pIdPlanoPrev;
   qryDatas.ParamByName('IdSitPart').AsString := pIdSitPart;
   qrydatas.parambyname('idplanass').AsInteger := pIdPlanass;
   qryDatas.Open;

   // Preencher datas do Grupo Normal
   spedNormal.Text := qryDatas.FieldByName('DiaCobNormal').AsString;
   if qryDatas.FieldByName('flgUtilNormal').AsString = 'U'
   then rgrpUtilNormal.ItemIndex := 1 //Sim
   else rgrpUtilNormal.ItemIndex := 0; //Não
   if qryDatas.FieldByName('flgAnteriorNormal').AsString = 'A'
   then rgrpAntNormal.ItemIndex := 0 // Anterior
   else rgrpAntNormal.ItemIndex := 1; // Posterior
   if qryDatas.FieldByName('flgMesCobNormal').AsString = 'A'
   then rgrpMesNormal.ItemIndex := 0
   else if qryDatas.FieldByName('flgMesCobNormal').AsString = 'C'
   then rgrpMesNormal.ItemIndex := 1
      else rgrpMesNormal.ItemIndex := 2 ;

   // Preencher datas do Grupo Atrasado
   spedAtraso.Text := qryDatas.FieldByName('DiaCobAtraso').AsString;
   if qryDatas.FieldByName('flgUtilAtraso').AsString = 'U'
   then rgrpUtilAtraso.ItemIndex := 1 //Sim
   else rgrpUtilAtraso.ItemIndex := 0; //Não
   if qryDatas.FieldByName('flgAnteriorAtraso').AsString = 'A'
   then rgrpAntAtraso.ItemIndex := 0 // Anterior
   else rgrpAntAtraso.ItemIndex := 1; // Normal
   if qryDatas.FieldByName('flgMesCobAtraso').AsString = 'A'
   then rgrpMesAtraso.ItemIndex := 0
   else if qryDatas.FieldByName('flgMesCobAtraso').AsString = 'C'
   then rgrpMesAtraso.ItemIndex := 1
      else rgrpMesAtraso.ItemIndex := 2;

   // Preencher datas do Grupo Devolucao
   spedDevolucao.Text := qryDatas.FieldByName('DiaCobDevolucao').AsString;
   if qryDatas.FieldByName('flgUtilDevolucao').AsString = 'U'
   then rgrpUtilDevolucao.ItemIndex := 1 //Sim
   else rgrpUtilDevolucao.ItemIndex := 0; //Não
   if qryDatas.FieldByName('FLGANTERIORDEVOL').AsString = 'A'
   then rgrpAntDevolucao.ItemIndex := 0 // Anterior
   else rgrpAntDevolucao.ItemIndex := 1; // Normal
   if qryDatas.FieldByName('FLGMESCOBDEVOLUC').AsString = 'A'
   then rgrpMesDevolucao.ItemIndex := 0
   else if qryDatas.FieldByName('FLGMESCOBDEVOLUC').AsString = 'C'
   then rgrpMesDevolucao.ItemIndex := 1
      else rgrpMesDevolucao.ItemIndex := 2;
end;//PreencheDatas

procedure TfrmCadDatasPlanass.LimpaDatas;
begin

   // Preencher datas do Grupo Normal
   spedNormal.Value := 1;
   rgrpUtilNormal.ItemIndex := 1; //Sim
   rgrpAntNormal.ItemIndex := 0; // Anterior

   // Preencher datas do Grupo Atrasado
   spedAtraso.Value := 1;
   rgrpUtilAtraso.ItemIndex := 1; //Sim
   rgrpAntAtraso.ItemIndex := 0; // Anterior

   // Preencher datas do Grupo Devolucao
   spedDevolucao.Value := 1;
   rgrpUtilDevolucao.ItemIndex := 1 ;//Sim
   rgrpAntDevolucao.ItemIndex := 0; // Anterior

end;//LimpaDatas


procedure TfrmCadDatasPlanass.ValidaDatasPatro;
var
    i : integer;
    sCodSitPart : string;
begin
   if not qryPlanPatro.Active then Exit;
   // Verificar se todas as situacoes de todos os planos da patrocinadora
   // estão na tabela. Senao -> inserir
   qryPlanPatro.First;
   while not qryPlanPatro.Eof do
   begin
      for i := 1 to iTamSitPart do
      begin
         //pIdPessJur := liIdPatro;
         pIdPlanass := qryPlanPatro.FieldByName('IdPlanass').AsInteger;
         if lstAuxTipo.Items[i] = 'PL' then continue;
         sCodSitPart := lstAuxTipo.Items[i];
         qryDatas.Close;
         qryDatas.ParamByName('IdPessJur').AsInteger := pIdPessJur;
         qryDatas.ParamByName('IdPlanoPrev').AsInteger := pIdPlanoPrev;
         qryDatas.ParamByName('IdSitPart').AsString := sCodSitPart;
         qryDatas.Parambyname('IdPlanass').AsInteger := pIdPlanass ;
         qryDatas.Open;
         if qryDatas.isempty
         then begin // Esta Patro + Plano + Situacao nao está na tabela
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' INSERT INTO DATASPATROPLANASS(IDPESSJUR,IDPLANOPREV,IDPLANASS,SITFUNDACAO, '+
                           '                             DIACOBNORMAL,FLGUTILNORMAL,FLGANTERIORNORMAL, '+
                           '                             DIACOBATRASO,FLGUTILATRASO,FLGANTERIORATRASO, '+
                           '                             DIACOBDEVOLUCAO,FLGUTILDEVOLUCAO,FLGANTERIORDEVOL ) '+
                           ' VALUES ( '+IntToStr(pIdPessJur)+','+IntToStr(pIdPlanoPrev)+','+inttostr(pIdplanass)+','''+sCodSitPart+''', '+
                           '          1, ''N'', ''A'', '+
                           '          1, ''N'', ''A'', '+
                           '          1, ''N'', ''A'' )');
            try
               qryAux.ExecSQL;
            except
               on E:EDBEngineError do
               begin
                  MostrarErro(E);
                  Exit;
               end;
            end; //try
         end;// if isempty
      end;//for
      qryPlanPatro.Next;
   end;
end;//ValidaDatasPatro

procedure TfrmCadDatasPlanass.GravaDatas;
var sSQL,
    sSQLWhere : string;
    iItem,
    iSitSelecionada,
    iPlanoSelecionado : integer;
    sPlanoSelecionado,
    sIdSitSelecionada,
    pIdSitPart   : string;
begin
   iItem := trvPlanos.Selected.AbsoluteIndex;
   if iItem < 0 // não tem nenhum item selecionado
   then begin
      MsgDlg('Selecione item antes desta operação','Erro ',mtError,[mbOk,mbHelp],0);
      Exit;
   end;

   iSitSelecionada := iItem;
   sIdSitSelecionada := lstAuxTipo.Items[iSitSelecionada];

   if trvPlanos.Selected.AbsoluteIndex < 0
   then iPlanoSelecionado := 1
   else iPlanoSelecionado := trvPlanos.Selected.Parent.AbsoluteIndex;
   sPlanoSelecionado := trvPlanos.Items.Item[iPlanoSelecionado].Text;

   // Preencher Parametros
   //pIdPessJur := liIdPatro;
   if qryPlanPatro.Locate('Nome',sPlanoSelecionado,[loCaseInsensitive,loPartialKey])
   then pIdPlanass := qryPlanPatro.FieldByName('IdPlanass').AsInteger
   else pIdPlanass := -1;
   pIdSitPart := sIdSitSelecionada;


   //Preencher dados do Grupo Normal
   sSQL := ' DIACOBNORMAL = '+IntToStr(spedNormal.Value);
   if rgrpUtilNormal.ItemIndex = 0
   then sSQL := sSQL +', FLGUTILNORMAL = ''N''' //Normal
   else sSQL := sSQL +', FLGUTILNORMAL = ''U'''; //Util
   if rgrpAntNormal.ItemIndex = 0
   then sSQL := sSQL +', FLGANTERIORNORMAL = ''A''' //Anterior
   else sSQL := sSQL +', FLGANTERIORNORMAL = ''P'''; //Posterior
   if rgrpMesNormal.ItemIndex = 0
   then sSQL := sSQL + ', FLGMESCOBNORMAL = ''A'' ' //Anterior
   else if   rgrpMesNormal.ItemIndex = 1
   then  sSQL := sSQL + ', FLGMESCOBNORMAL = ''C'' ' //Corrente
      else sSQL := sSQL + ', FLGMESCOBNORMAL = ''P'' '; //Posterior

   //Preencher dados do Grupo Atrasado
   sSQL := sSQL + ', DIACOBATRASO = '+IntToStr(spedATRASO.Value);
   if rgrpUtilATRASO.ItemIndex = 0
   then sSQL := sSQL +', FLGUTILATRASO = ''N''' //Normal
   else sSQL := sSQL +', FLGUTILATRASO = ''U'''; //Util
   if rgrpAntATRASO.ItemIndex = 0
   then sSQL := sSQL +', FLGANTERIORATRASO = ''A''' //Anterior
   else sSQL := sSQL +', FLGANTERIORATRASO = ''P'''; //Posterior
   if rgrpMesATRASO.ItemIndex = 0
   then sSQL := sSQL + ', FLGMESCOBATRASO = ''A'' ' //Anterior
   else if rgrpMesATRASO.ItemIndex =  1
   then  sSQL := sSQL + ', FLGMESCOBATRASO = ''C'' '//corrente
      else sSQL := sSQL + ', FLGMESCOBATRASO = ''P'' '; //Posterior

   //Preencher dados do Grupo Devolucao
   sSQL := sSQL + ', DIACOBDEVOLUCAO = '+IntToStr(spedDEVOLUCAO.Value);
   if rgrpUtilDEVOLUCAO.ItemIndex = 0
   then sSQL := sSQL +', FLGUTILDEVOLUCAO = ''N''' //Normal
   else sSQL := sSQL +', FLGUTILDEVOLUCAO = ''U'''; //Util
   if rgrpAntDEVOLUCAO.ItemIndex = 0
   then sSQL := sSQL +', FLGANTERIORDEVOL = ''A''' //Anterior
   else sSQL := sSQL +', FLGANTERIORDEVOL = ''P'''; //Posterior
   if rgrpMesDEVOLUCAO.ItemIndex = 0
   then sSQL := sSQL + ', FLGMESCOBDEVOLUC = ''A'' ' //Anterior
   else if  rgrpMesDEVOLUCAO.ItemIndex = 1
   then sSQL := sSQL + ', FLGMESCOBDEVOLUC = ''C'' ' //corrente
      else sSQL := sSQL + ', FLGMESCOBDEVOLUC = ''P'' '; //Posterior

   // Preencher campos chave

   sSQLWhere := ' (IDPESSJUR = '+IntToStr(pIDPessJur)+') AND '+
                ' (IDPLANOPREV =  '+IntToStr(pIdPlanoPrev)+ ') AND '+
                ' (IDPLANASS   = '+inttostr(pIdplanass)+') AND '+
                ' (SITFUNDACAO = '''+pIdSitPart+''') ' ;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQl.Add(' UPDATE DATASPATROPLANASS SET '+sSQL+
                  ' WHERE '+sSQLWhere );
   try
      qryAux.ExecSQL;
   except
      on E:EDBEngineError do
      begin
         MostrarErro(E);
         Exit;
      end;
   end;
   MsgDlg('Dados gravados corretamente.','Informação ',mtInformation,[mbOk,mbHelp],0);
end;//GravaDatas

procedure TfrmCadDatasPlanass.FormActivate(Sender: TObject);
begin
  inherited;
  try
     if primeiro then bbtnProcurarClick(self);
  except end;
  primeiro := false;
end;

procedure TfrmCadDatasPlanass.FormShow(Sender: TObject);
begin
  inherited;
  liIdPatro := iIdPatrocin;
end;

procedure TfrmCadDatasPlanass.trvPlanosCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  inherited;
  Node.ImageIndex := 0;
  Node.SelectedIndex := 0;

end;

procedure TfrmCadDatasPlanass.trvPlanosExpanded(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  Node.ImageIndex := 1;
  Node.SelectedIndex := 1;
end;

procedure TfrmCadDatasPlanass.trvPlanosExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  Node.ImageIndex := 1;
  Node.SelectedIndex := 1;
end;

procedure TfrmCadDatasPlanass.trvPlanosChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  PreencheDatas;
end;

procedure TfrmCadDatasPlanass.FormCreate(Sender: TObject);
begin
  inherited;
  bValidado := False;
  pRIMEIRO := True;
end;

procedure TfrmCadDatasPlanass.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  PreencheDatas;
end;

procedure TfrmCadDatasPlanass.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  GravaDatas;
  PreencheDatas;
end;

procedure TfrmCadDatasPlanass.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   MontaSel.Executar;

   if MontaSel.RetornouValor then
   begin
     try
        pIdPessjur := StrToIntDef(Montasel.ValoresChave[0],0);
        pIdPlanoprev := StrToIntDef(Montasel.ValoresChave[1],0);
        qryPlanPatro.Close;
        qryPlanPatro.ParamByName('IdPessJur').AsInteger := pIdpessjur;
        qryPlanPatro.ParamByName('IdPlanoprev').AsInteger := pIdPlanoprev;
        qryPlanPatro.Open;
        stxtPatro.Caption := ''+qryPlanPatro.fieldbyname('patro').AsString+'/'+qryPlanPatro.fieldbyname('prev').AsString+'';
        MontaTree;
        ValidaDatasPatro;
        PreencheDatas;
        pnlNormal.enabled := True;
        pnlAtraso.enabled := True;
        pnlDevol.enabled := True;
     except
        pnlNormal.enabled := false;
        pnlAtraso.enabled := false;
        pnlDevol.enabled := false;
        stxtPatro.Caption := '';
        stxtDatas.Caption := '';
        qryplanpatro.close;
        LimpaDatas;
        trvPlanos.Items.Clear
     end;
   end;
end;

end.
