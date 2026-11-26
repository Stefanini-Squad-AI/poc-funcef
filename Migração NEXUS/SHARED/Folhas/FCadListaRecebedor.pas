// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : btnGeraListaValidacaoClick
// Autor(a)    : Fabio Sampaio
// Data        : 10/07/2019
// SIG         : 57770
// Descricao   : Alteração para buscar as informações do mês corrente na PREVIA
//               ao invés do mês anterior na HISTRUBSAL
//------------------------------------------------------------------------------
// Rotina      : btnGeraListaValidacaoClick, ExistePessoaLista, edtQtdePessoaExit
// Autor(a)    : Fabio Sampaio
// Data        : 25/06/2019
// SIG         : 57770
// Descricao   : Implementação da rotina para "Gera Lista de Validação" com base
//               na "Quantidade de Beneficiário por Situação" informada.
//------------------------------------------------------------------------------
// Rotina      : BtnImportarClick
// Autor(a)    : Andre Imakawa
// Data        : 17/05/2019
// SIG         : 86329
// Descricao   : Fazer a busca pelo campo MATRICULADEP.
//------------------------------------------------------------------------------
// Rotina      : (.dfm  qryDet), BtnImportarClick
// Autor(a)    : edilaine
// Data        : 03/04/2019
// SIG         : 84036
// Descricao   : Importação critica matriculas mas permite inclusão manual (FLGDESATIVADO)
//------------------------------------------------------------------------------
// Autor(a)    : Helio Lima Custodio
// Data        : 31/03/2015
// Rotina      : Inclusao BtnGeraLstIndivClick
// SOL         : 249100
// PPM         : 736486
// DFM         : Inclusao do botao BtnGeraLstIndiv e posicao do botao BtnImportar
// Descricao   : Alteração na query para trazer idpessoa e idtitular e não só idtitular.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 05/01/2007
// Rotina      : BtnImportarClick
// Pendência   : 24128
// Descricao   : Alteração na query para trazer idpessoa e idtitular e não só idtitular.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 11/01/2006
// Rotina      : Várias
// Pendência   : 21238
// Descricao   : Alterar o monta select para buscar por CPF. Usar o componente
//               dfolha.MSBenef no lugar do que existe nesta tela MontaSelect1.
//               Efetuar a importação de arquivo por CPF.
//------------------------------------------------------------------------------
{==============================================================================|
| UNIT: FCADLISTARECEBEDOR                                                     |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TELA DE CADASTRO DE LISTAS DE PESSOAS PARA PROCESSAMENTO NA FOLHA.         |
|                                                                              |
===============================================================================}
unit FCadListaRecebedor;

interface

uses
  ShellAPI, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, wwdblook, CmEventosCadastro, ImgList,
  MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc,
  Wwquery, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, DBCtrls,
  Wwdbspin;

type
  TFrmCadListaRecebedor = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    qryDet: TwwQuery;
    BtnImportar: TBitBtn;
    qryMatric: TwwQuery;
    OpenDialog1: TOpenDialog;
    qryBeneficiarios: TwwQuery;
    DBcboTit: TwwDBLookupCombo;
    DBcboBenef: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    qryIDLISTA: TFloatField;
    qryFLGTIPOLISTA: TFloatField;
    qryNOME: TStringField;
    qryDetAux: TwwQuery;
    EdtNomeLista: TwwDBEdit;
    UpdDet: TUpdateSQL;
    qryDetIDLISTA: TFloatField;
    qryDetMATRICULA: TStringField;
    qryDetTITULAR: TStringField;
    qryDetRECEBEDOR: TStringField;
    qryDetIDTITULAR: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDREFERENCIA: TFloatField;
    dbrTipoLista: TDBRadioGroup;
    Label4: TLabel;
    DbEdtNumLista: TwwDBEdit;
    RdgTipoArq: TRadioGroup;
    MontaSelect1: TMontaSelect;
    qryDetINSCRICAONUMERO: TFloatField;
    lblQuant: TLabel;
    mmRejeitados: TMemo;
    lblProgresso: TLabel;
    qryDetNUMDOCUMENTO: TStringField;
    BtnGeraLstIndiv: TBitBtn;
    Label5: TLabel;
    btnGeraListaValidacao: TBitBtn;
    edtQtdePessoa: TwwDBSpinEdit;
    procedure BtnImportarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure BtnGeraLstIndivClick(Sender: TObject);
    procedure btnGeraListaValidacaoClick(Sender: TObject);
    procedure edtQtdePessoaExit(Sender: TObject);
  private
    { Private declarations }
    GuardaIdLista           : Integer;
    iProxLista              : Integer;
    procedure Sel(idLista: Integer);
    function ExistePessoaLista(iidtitular, iidpessoa: integer;
                               iidreferencia: integer = -1 // Alterado por FHBS - 25/06/2019 - SIG57770
                               ): boolean;
    function PegaNomeTitular(asidtitular: string): string;
  public
    { Public declarations }
  end;

var
  FrmCadListaRecebedor : TFrmCadListaRecebedor;

implementation

Uses
  FAguarde, uDataBase, dBaseDados, uMensErro, DFolha,

  FGeraLstIndiv, USistema; //Helio - SOL Nº 249100 PPM Nº 736486

{$R *.DFM}

function TFrmCadListaRecebedor.ExistePessoaLista(iidtitular,
  iidpessoa: integer;
  iidreferencia: integer = -1 // Alterado por FHBS - 25/06/2019 - SIG57770
  ): boolean;
begin
  // Alterado por FHBS - 25/06/2019 - SIG57770
  if iidreferencia > 0 then
    result := qryDet.locate('idtitular;idpessoa;idreferencia',vararrayof([iidtitular, iidpessoa, iidreferencia]), [])
  else // Fim - Alterado por FHBS - 25/06/2019 - SIG57770
    result := qryDet.locate('idtitular;idpessoa',vararrayof([iidtitular, iidpessoa]), []);
end;

procedure TFrmCadListaRecebedor.BtnImportarClick(Sender: TObject);
Var
  lstpart: tstringlist;
  lii,
  GuardaIdPessoa,
  IdPessoaAnt,
  GuardaIdTitular: integer;
  ssql, ssqldet: string;
  spontos,ss: string;
begin
  inherited;
  mmRejeitados.lines.clear;

  sbtnInsDet.Enabled      := False;
  sbtnExcluiDet.Enabled   := False;

  If RdgTipoArq.ItemIndex = -1 Then
  Begin
    ShowMessage('Selecione um Tipo de Arquivo.');
    If RdgTipoArq.CanFocus Then
      RdgTipoArq.SetFocus;
    Abort;
  End; { If RdgTipoArq.ItemIndex = -1 Then Begin }

  bbtnSair.Enabled        := False;
  bbtnAjuda.Enabled       := False;

  If OpenDialog1.Execute Then
  Begin
    Try
      lblProgresso.visible:=true;
      lstpart:=tstringlist.create;
      lstpart.loadfromfile(OpenDialog1.FileName);
      spontos:='..';

      For lii:=0 to lstpart.count-1 Do
      begin
        if length(spontos) >= 15 then
          spontos:='..'
        else
          spontos:=spontos+'.';
        lblProgresso.caption:='Importando registro '+inttostr(lii)+'. Aguarde'+spontos;
        lblProgresso.update;
        application.processmessages;
        If trim(lstpart[lii]) <> '' Then
        Begin
          qrymatric.close;
          //edilaine - SIG84036 - inicio
          //comentado
          {ssql:='select distinct p1.nome as titular, p2.nome as benef, '+
                       'e.matricula, pp.inscricaonumero, '+
                       'bf.idpessoa, bf.idtitular, p2.numdocumento ' +
                'from elegpatro e, partprevplan pp, depentit bf, '+
                     'pessoa p1, pessoa p2 ';

          //Importar arquivo com CPF
          case RdgTipoArq.ItemIndex of
          0: begin
               ssql:=ssql+
                 'where (e.matricula = '''+trim(lstpart[lii])+''') ' +
                 'and (pp.idpessoa = e.idpessoa) ' +
                 'and (pp.idpessjur = e.idpessjur) ' +
                 'and (bf.idtitular = pp.idpessoa) ' +
                 'and (p1.idpessoa = bf.idtitular) ' +
                 'and (p2.idpessoa = bf.idpessoa) ';
               //'and (pp.flgdesativado = 0)';
             end;
          1: begin
               ssql:=ssql+
                 'where (pp.inscricaonumero = '''+trim(lstpart[lii])+''') ' +
                 'and (pp.idpessoa = e.idpessoa) ' +
                 'and (pp.idpessjur = e.idpessjur) ' +
                 'and (bf.idtitular = pp.idpessoa) ' +
                 'and (p1.idpessoa = bf.idtitular) ' +
                 'and (p2.idpessoa = bf.idpessoa) ' +
                 'and (pp.flgdesativado = 0)';
             end;
          2: begin
               ssql:=ssql+
                 'where (p2.numdocumento = '''+trim(lstpart[lii])+''') ' +
                 'and (pp.idpessoa = e.idpessoa) ' +
                 'and (pp.idpessjur = e.idpessjur) ' +
                 'and (bf.idtitular = pp.idpessoa) ' +
                 'and (p1.idpessoa = bf.idtitular) ' +
                 'and (p2.idpessoa = bf.idpessoa) ' +
                 'and (pp.flgdesativado = 0)';
             end;
          end;
          }//fim comentado

          ssql := 'SELECT VW.MATRICULA,       '
                + '       VW.MATRICULADEP,    '
                + '       VW.INSCRICAONUMERO, '
                + '       PE.NOME AS TITULAR, '
                + '       VW.NOME AS BENEF,   '
                + '       VW.NUMDOCUMENTO,    '
                + '       VW.IDTITULAR,       '
                + '       VW.IDPESSOA,        '
                + '       VW.SITPATRO,        '
                + '       VW.IDDEPENDENCIA,   '
                + '       VW.IDPESSJUR,       '
                + '       VW.IDPLANOPREV,     '
                + '       VW.IDSITPART,       '
                + '       VW.FLGDESATIVADO,   '
                + '       VW.PLANO,           '
                + '       VW.PATRO,           '
                + '       VW.DESCRICAO,       '
                + '       VW.SITFUND          '
                + '  FROM                                  '
                + '       VWPARTICIPDEPEN VW               '
                + '       JOIN PESSOA PE ON PE.IDPESSOA = VW.IDTITULAR '
                + ' WHERE                                  '
                + '       ( IDPLANOPREV IS NOT NULL ) AND  ';

          //Importar arquivo com CPF
          case RdgTipoArq.ItemIndex of
          0: begin
               ssql:=ssql+
                  '       (VW.MATRICULA = '''+trim(lstpart[lii])+''') ';
             end;
          1: begin
               ssql:=ssql+
                  '       (VW.INSCRICAONUMERO = '''+trim(lstpart[lii])+''') ';
             end;
          2: begin
               ssql:=ssql+
                  '       (VW.NUMDOCUMENTO = '''+trim(lstpart[lii])+''') ';
             end;
          end;
          //edilaine - SIG84036 - fim

          qrymatric.sql.text:=ssql;
          qrymatric.open;

          If Not qryMatric.isempty Then
          Begin
            While Not qryMatric.Eof Do
            Begin
              GuardaIdTitular := qryMatric.FieldByName('IDTITULAR').AsInteger;
              GuardaIdPessoa  := qryMatric.FieldByName('IDPESSOA').AsInteger;
              if not ExistePessoaLista(GuardaIdTitular, GuardaIdPessoa) then
              begin
                qryDet.Append;
                qryDetIDLISTA.AsInteger         := GuardaIdLista;
                qryDetIDTITULAR.AsInteger       := GuardaIdTitular;
                qryDetIDPESSOA.AsInteger        := GuardaIdPessoa;
                qryDetIDREFERENCIA.AsInteger    := GuardaIdPessoa;
                qryDetTITULAR.AsString          := qryMatric.FieldByName('TITULAR').AsString;
                qryDetRECEBEDOR.AsString        := qryMatric.FieldByName('BENEF').AsString;
                qryDetMATRICULA.AsString        := qryMatric.FieldByName('MATRICULA').AsString;
                qryDetINSCRICAONUMERO.AsInteger := qryMatric.FieldByName('INSCRICAONUMERO').AsInteger;
                qryDetNUMDOCUMENTO.asstring     := qryMatric.fieldbyname('NUMDOCUMENTO').asstring;
                qryDet.Post;
              end;
              //edilaine - SIG84036 - inicio
              {else
              begin
                mmRejeitados.lines.add(lstpart[lii]);
              end;
              }//edilaine - SIG84036 - fim
              qryMatric.Next;
            End; { While Not qryMatric.Eof Do Begin }
          End { If Not qryMatric.isempty Then Begin }
          else
          begin
            If RdgTipoArq.ItemIndex = 0 Then
            Begin
              //edilaine - SIG84036 - inicio
              ssql:='select distinct p1.nome as titular, p2.nome as benef, '+
                           'd2.matricula, pp.inscricaonumero, '+ //Andre Imakawa - SIG 86329
                           'd.idpessoa, d.idtitular ' +
                    'from elegpatro e, partprevplan pp, depentit d, '+
                         'pessoa p1, pessoa p2, '+			//Andre Imakawa - SIG 86329
                         'depentit d2           '+			//Andre Imakawa - SIG 86329
                         'where (d.matricula = '''+trim(lstpart[lii])+''') ' +
                         'and (pp.idpessoa = d.idtitular) ' +
                         'and (p1.idpessoa = d.idtitular) ' +
                         'and (p2.idpessoa = d.idpessoa) '+
                         'and (d2.idpessoa = d.idtitular) '+		//Andre Imakawa - SIG 86329
                         'and (d2.idtitular = d.idtitular) '+		//Andre Imakawa - SIG 86329
                         'and (pp.flgdesativado = 0)';
              {
              ssql := 'SELECT VW.MATRICULA,       '
                    + '       VW.MATRICULADEP,    '
                    + '       VW.INSCRICAONUMERO, '
                    + '       PE.NOME AS TITULAR, '
                    + '       VW.NOME AS BENEF,   '
                    + '       VW.NUMDOCUMENTO,    '
                    + '       VW.IDTITULAR,       '
                    + '       VW.IDPESSOA         '
                    + '  FROM                                  '
                    + '       VWPARTICIPDEPEN VW               '
                    + '  JOIN PESSOA PE ON PE.IDPESSOA = VW.IDTITULAR    '
                    + '  JOIN DEPENTIT DP ON DP.IDPESSOA  = VW.IDPESSOA  '
                    + '                  AND DP.IDTITULAR = VW.IDTITULAR '
                    + ' WHERE                                  '
                    + '       ( IDPLANOPREV IS NOT NULL ) AND  '
                    + '       (VW.MATRICULADEP = '''+trim(lstpart[lii])+''') '; //Andre Imakawa - SIG 86329
              }
              //edilaine - SIG84036 - fim

              qrymatric.sql.text:=ssql;
              qrymatric.open;

              If Not qryMatric.isempty Then
              Begin

              //Andre Imakawa - SIG 86329 - Inicio
                ssql := 'SELECT VW.MATRICULA,       '
                      + '       VW.MATRICULADEP,    '
                      + '       VW.INSCRICAONUMERO, '
                      + '       PE.NOME AS TITULAR, '
                      + '       VW.NOME AS BENEF,   '
                      + '       VW.NUMDOCUMENTO,    '
                      + '       VW.IDTITULAR,       '
                      + '       VW.IDPESSOA,        '
                      + '       VW.SITPATRO,        '
                      + '       VW.IDDEPENDENCIA,   '
                      + '       VW.IDPESSJUR,       '
                      + '       VW.IDPLANOPREV,     '
                      + '       VW.IDSITPART,       '
                      + '       VW.FLGDESATIVADO,   '
                      + '       VW.PLANO,           '
                      + '       VW.PATRO,           '
                      + '       VW.DESCRICAO,       '
                      + '       VW.SITFUND          '
                      + '  FROM                                  '
                      + '       VWPARTICIPDEPEN VW               '
                      + '       JOIN PESSOA PE ON PE.IDPESSOA = VW.IDTITULAR '
                      + ' WHERE                                  '
                      + '       ( IDPLANOPREV IS NOT NULL ) AND  '
                      + '       (VW.MATRICULA = '''+ qrymatric.FieldByName('MATRICULA').AsString +''') ';

                qrymatric.sql.text:=ssql;
                qrymatric.open;
                //Andre Imakawa - SIG 86329 - Fim

                While Not qryMatric.Eof Do
                Begin
                  GuardaIdTitular := qryMatric.FieldByName('IDTITULAR').AsInteger;
                  GuardaIdPessoa  := qryMatric.FieldByName('IDPESSOA').AsInteger;
                  if not ExistePessoaLista(GuardaIdTitular, GuardaIdPessoa) then
                  begin
                    qryDet.Append;
                    qryDetIDLISTA.AsInteger         := GuardaIdLista;
                    qryDetIDTITULAR.AsInteger       := GuardaIdTitular;
                    qryDetIDPESSOA.AsInteger        := GuardaIdPessoa;
                    qryDetIDREFERENCIA.AsInteger    := GuardaIdPessoa;
                    qryDetTITULAR.AsString          := qryMatric.FieldByName('TITULAR').AsString;
                    qryDetRECEBEDOR.AsString        := qryMatric.FieldByName('BENEF').AsString;
                    qryDetMATRICULA.AsString        := qryMatric.FieldByName('MATRICULA').AsString;
                    qryDetINSCRICAONUMERO.AsInteger := qryMatric.FieldByName('INSCRICAONUMERO').AsInteger;
                    qryDetNUMDOCUMENTO.asstring     := qryMatric.fieldbyname('NUMDOCUMENTO').asstring;         //edilaine - SIG84036
                    qryDet.Post;
                  end;
                  //edilaine - SIG84036 - inicio
                  {else
                  begin
                    mmRejeitados.lines.add(lstpart[lii]);
                  end;
                  }//edilaine - SIG84036 - fim
                  qryMatric.Next;
                End;
              end
              else
              begin
                mmRejeitados.lines.add(lstpart[lii]);
              end;
            end;
          end;
        End; { If trim(lstpart[lii]) <> '' Then Begin }
      end;
    Finally
      lblProgresso.visible:=false;
      lstpart.free;
      bbtnSair.Enabled        := True;
      bbtnAjuda.Enabled       := True;
      BtnImportar.Enabled     := False;
      RdgTipoArq.Enabled      := False;

      If Not qryDet.IsEmpty Then
      Begin
        sbtnInsDet.Enabled    := True;
        sbtnExcluiDet.Enabled := True;
      End; { If Not qryDet.IsEmpty Then Begin }

      lblQuant.caption:='Quantidade: '+inttostr(qryDet.recordcount)+' pessoas ';

      if mmRejeitados.lines.count > 0 then
      begin
        MsgDlg('Algumas matrículas não foram importadas e serão exibidas após pressionar OK.',
               'Atenção',mtWarning,[mbOk,mbHelp],0);
        fillchar(ss,sizeof(ss),#0);
        ss:=OpenDialog1.FileName+'.REJEITADO';
        mmRejeitados.lines.savetofile(ss);
        ShellExecute(handle, 'open', Pchar(@ss[1]), nil, nil, SW_SHOWNORMAL);
      end;
    End; { Try, Finally }
  End
  Else
  Begin
    bbtnSair.Enabled  := True;
    bbtnAjuda.Enabled := True;
  End; { If OpenDialog1.Execute Then Begin }
end; { Fim da Procedure }

procedure TFrmCadListaRecebedor.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
    GuardaIdLista       := StrToInt(MontaSelect.ValoresChave[0]);
    qryDet.Close;
    qryDet.ParamByName('IDLISTA').AsInteger := GuardaIdLista;
    qryDet.Open;
    lblQuant.caption:='Quantidade: '+inttostr(qryDet.recordcount)+' pessoas ';
  End;
end;

procedure TFrmCadListaRecebedor.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
Var
  sSql : String;

begin
  Accept := True;
  If (Trim(EdtNomeLista.Text) = '') Then
  Begin
    ShowMessage('Digite o Nome da Lista.');
    If EdtNomeLista.CanFocus Then
      EdtNomeLista.SetFocus;

    Accept := False;
  End;
  If dbrTipoLista.ItemIndex = -1 Then
  Begin
    ShowMessage('Selecione um Tipo de Lista.');
    If dbrTipoLista.CanFocus Then
      dbrTipoLista.SetFocus;

    Accept := False;
  End;
  inherited;
end;

procedure TFrmCadListaRecebedor.CmeCadastroDelete(Sender: TObject);
Var
  sSql : String;
begin
  sSql := 'DELETE LISTAFOLHABENEFDET '+
          'WHERE IDLISTA = '+qryIDLISTA.AsString ;

  If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  qryDetAux.SQL.Clear;
  qryDetAux.SQL.Add(sSql);
  Try
    qryDetAux.ExecSQL;
  Except
    dtmBaseDados.dbBaseDados.Rollback;
    MsgDlg('Ocorreu um Erro Durante a Exclusão!!!',
            'Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  End;
  dtmBaseDados.dbBaseDados.Commit;
  BtnImportar.Enabled    := False;
  inherited;
  qryDet.Close;
end;

procedure TFrmCadListaRecebedor.FormShow(Sender: TObject);
begin
  inherited;
  Sel(-1);
  WindowState:=wsMaximized;

  //INICIO Helio - SOL Nº 249100 PPM Nº 736486
  if Sistema.IdModulo = 18 then //botao somente para Folha de Beneficios
       BtnGeraLstIndiv.Visible := True;
  //FIM Helio - SOL Nº 249100 PPM Nº 736486
end;

procedure TFrmCadListaRecebedor.Sel(idLista: Integer);
begin
  qry.Close;
  qry.ParamByName('IDLISTA').AsInteger := idLista;
  qry.Open;
end;

procedure TFrmCadListaRecebedor.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if qryDet.State in [dsInsert, dsEdit] then
    qryDetIDLISTA.AsInteger := qryIDLISTA.AsInteger;
end;

procedure TFrmCadListaRecebedor.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  EdtNomeLista.SetFocus;
  iProxLista:=LeUltRegistro(Nil,'LISTAFOLHABENEF');
  qryDet.Close;
  qryDet.ParamByName('IDLISTA').AsInteger := iProxLista;
  qryDet.Open;
  lblQuant.caption:='Quantidade: '+inttostr(qryDet.recordcount)+' pessoas ';
  qryIDLISTA.AsInteger  := iProxLista;
  DbEdtNumLista.Text    := IntToStr(iProxLista);
  DbEdtNumLista.Enabled := False;
  Label4.Enabled        := False;
  RdgTipoArq.Enabled    := False;
  btnImportar.Enabled   := False;
  sbtnExcluiDet.Enabled := False;
  GuardaIdLista         := iProxLista;
end;

procedure TFrmCadListaRecebedor.CmeDetalheConfirma(Sender: TObject);
begin
  If qryDet.State In [dsInsert, dsEdit] Then
  Begin
    qryDetIDLISTA.AsInteger        := GuardaIdLista;
    qryDetTITULAR.AsString         := PegaNomeTitular(dtmfolha.MSBenef.ValoresChave[5]);
    qryDetMATRICULA.AsString       := dtmfolha.MSBenef.ValoresChave[1];
    qryDetINSCRICAONUMERO.AsString := dtmfolha.MSBenef.ValoresChave[10{2}];
    qryDetRECEBEDOR.AsString       := dtmfolha.MSBenef.ValoresChave[6{3}];
    qryDetIDTITULAR.AsInteger      := StrToInt(dtmfolha.MSBenef.ValoresChave[5{4}]);
    qryDetIDPESSOA.AsInteger       := StrToInt(dtmfolha.MSBenef.ValoresChave[0{7}]);
    qryDetIDREFERENCIA.AsInteger   := StrToInt(dtmfolha.MSBenef.ValoresChave[0{7}]);
    qryDetNUMDOCUMENTO.asstring    := dtmfolha.MSBenef.ValoresChave[8];
    lblQuant.caption:='Quantidade: '+inttostr(qryDet.recordcount)+' pessoas ';
  End;
  inherited;
end;

procedure TFrmCadListaRecebedor.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  If qryDet.UpdatesPending then
    AplicaAlteracoes([TDBDataSet(dsDet.DataSet)]);
  qryDet.Close;
  qryDet.ParamByName('IDLISTA').AsInteger:=qryIDLISTA.AsInteger;
  qryDet.Open;
  lblQuant.caption:='Quantidade: '+inttostr(qryDet.recordcount)+' pessoas ';
end;

procedure TFrmCadListaRecebedor.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  If (Trim(DbEdtNumLista.Text) <> '') Then
  Begin
    qryDet.Close;
    qryDet.ParamByName('IDLISTA').AsInteger := StrToInt(DbEdtNumLista.Text);
    qryDet.Open;
    lblQuant.caption:='Quantidade: '+inttostr(qryDet.recordcount)+' pessoas ';
  End;
end;

procedure TFrmCadListaRecebedor.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  btnImportar.Enabled := True;
  RdgTipoArq.Enabled  := True;
  qryDet.Close;
  qryDet.ParamByName('IDLISTA').AsInteger := GuardaIdLista;
  qryDet.Open;
  lblQuant.caption:='Quantidade: '+inttostr(qryDet.recordcount)+' pessoas ';
end;

procedure TFrmCadListaRecebedor.bbtnConfirmarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  QryDet.ApplyUpdates;
  QryDet.CommitUpdates;
  inherited;
  Label4.Enabled            := True;
  DbEdtNumLista.Enabled     := True;
end;

procedure TFrmCadListaRecebedor.bbtnOkDetClick(Sender: TObject);
begin
  CmeDetalhe.RepetirInsert := False;
  inherited;
end;

procedure TFrmCadListaRecebedor.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  dtmfolha.MSBenef.Executar;
  If dtmfolha.MSBenef.RetornouValor Then
  Begin
    DBcboTit.Text   := PegaNomeTitular(dtmfolha.MSBenef.ValoresChave[5]);
    DBcboBenef.Text := dtmfolha.MSBenef.ValoresChave[6{3}];
  End;
end;

function TFrmCadListaRecebedor.PegaNomeTitular(
  asidtitular: string): string;
begin
  qryDetAux.SQL.Clear;
  qryDetAux.SQL.Add(
    'SELECT NOME '+
    'FROM PESSOA '+
    'WHERE IDPESSOA = '+asidtitular);
  try
    qryDetAux.open;
    if qryDetAux.isempty then
      result:=''
    else
      result:=qryDetAux.fields[0].asstring;
  except
    result:='';
  end;
end;

//Helio - SOL Nº 249100 PPM Nº 736486
procedure TFrmCadListaRecebedor.BtnGeraLstIndivClick(Sender: TObject);
begin
  inherited;
  if FrmGeraLstIndiv = nil then
     FrmGeraLstIndiv := TFrmGeraLstIndiv.Create(Self);

  FrmGeraLstIndiv.ShowModal;

  FreeAndNil(FrmGeraLstIndiv);
end;

// Alterado por FHBS - 25/06/2019 - SIG57770
procedure TFrmCadListaRecebedor.btnGeraListaValidacaoClick(
  Sender: TObject);
begin
  inherited;

  qryMatric.Close;
  qryMatric.SQL.Clear;
  qryMatric.SQL.Add('SELECT DISTINCT LD.IDTITULAR');
  qryMatric.SQL.Add('      ,LD.IDPESSOA');
  qryMatric.SQL.Add('      ,LD.IDREFERENCIA');
  qryMatric.SQL.Add('      ,LD.MATRICULA');
  qryMatric.SQL.Add('      ,PT.NOME AS TITULAR');
  qryMatric.SQL.Add('      ,PP.NOME AS RECEBEDOR');
  qryMatric.SQL.Add('      ,(SELECT MIN(PPP.INSCRICAONUMERO) FROM PARTPREVPLAN PPP WHERE LD.IDTITULAR = PPP.IDPESSOA) AS INSCRICAONUMERO');
  qryMatric.SQL.Add('      ,PP.NUMDOCUMENTO');
  qryMatric.SQL.Add('FROM (');
  qryMatric.SQL.Add('  SELECT C11.IDTITULAR AS IDTITULAR');
  qryMatric.SQL.Add('        ,C11.IDPESSOA AS IDPESSOA');
  qryMatric.SQL.Add('        ,C11.IDPESSOA AS IDREFERENCIA');
  qryMatric.SQL.Add('        ,C11.MATRICULA AS MATRICULA');
  qryMatric.SQL.Add('        ,NULL AS IDREFERENCIA2');
  qryMatric.SQL.Add('        ,NULL AS IDREFERENCIA3');
  qryMatric.SQL.Add('    FROM (SELECT C1.*, ROWNUM SEQ');
  qryMatric.SQL.Add('            FROM (SELECT DP.IDTITULAR, DP.IDPESSOA, DP.MATRICULA, ''RRA'' CONTEXTO');
  qryMatric.SQL.Add('                    FROM PREVIA P');
  qryMatric.SQL.Add('                   INNER JOIN DEPENTIT DP ON P.IDPESSOA = DP.IDPESSOA');
  qryMatric.SQL.Add('                                         AND P.IDTITULAR = DP.IDTITULAR');
  qryMatric.SQL.Add('                   WHERE P.MESCOBRANCA = TO_CHAR(SYSDATE, ''YYYY/MM'')');
  qryMatric.SQL.Add('                     AND P.IDRUBRICA IN (SELECT PV.IDPROVENTO FROM PROVDESC PV WHERE (UPPER(PV.DESCRICAO) LIKE ''%RRA%''))');
  qryMatric.SQL.Add('                   GROUP BY DP.IDTITULAR, DP.IDPESSOA, DP.MATRICULA');
  qryMatric.SQL.Add('                   ORDER BY DBMS_RANDOM.VALUE) C1) C11');
  qryMatric.SQL.Add('   WHERE C11.SEQ <= ' + FloatToStr(edtQtdePessoa.Value));
  qryMatric.SQL.Add('  UNION');
  qryMatric.SQL.Add('  SELECT C11.IDTITULAR AS IDTITULAR');
  qryMatric.SQL.Add('        ,C11.IDPESSOA AS IDPESSOA');
  qryMatric.SQL.Add('        ,C11.IDPESSOA AS IDREFERENCIA');
  qryMatric.SQL.Add('        ,C11.MATRICULA AS MATRICULA');
  qryMatric.SQL.Add('        ,NULL AS IDREFERENCIA2');
  qryMatric.SQL.Add('        ,NULL AS IDREFERENCIA3');
  qryMatric.SQL.Add('    FROM (SELECT C1.*, ROWNUM SEQ');
  qryMatric.SQL.Add('            FROM (SELECT DP.IDTITULAR, DP.IDPESSOA, DP.MATRICULA, ''IN 1343'' CONTEXTO');
  qryMatric.SQL.Add('                    FROM PREVIA P');
  qryMatric.SQL.Add('                   INNER JOIN DEPENTIT DP ON P.IDPESSOA = DP.IDPESSOA');
  qryMatric.SQL.Add('                                         AND P.IDTITULAR = DP.IDTITULAR');
  qryMatric.SQL.Add('                   WHERE P.MESCOBRANCA = TO_CHAR(SYSDATE, ''YYYY/MM'')');
  qryMatric.SQL.Add('                     AND P.IDRUBRICA IN (SELECT PV.IDPROVENTO FROM PROVDESC PV WHERE (UPPER(PV.DESCRICAO) LIKE ''%1343%''))');
  qryMatric.SQL.Add('                   GROUP BY DP.IDTITULAR, DP.IDPESSOA, DP.MATRICULA');
  qryMatric.SQL.Add('                   ORDER BY DBMS_RANDOM.VALUE) C1) C11');
  qryMatric.SQL.Add('   WHERE C11.SEQ <= ' + FloatToStr(edtQtdePessoa.Value));
  qryMatric.SQL.Add('  UNION');
  qryMatric.SQL.Add('  SELECT C11.IDTITULAR AS IDTITULAR');
  qryMatric.SQL.Add('        ,C11.IDPESSOA AS IDPESSOA');
  qryMatric.SQL.Add('        ,C11.IDPESSOA AS IDREFERENCIA');
  qryMatric.SQL.Add('        ,C11.MATRICULA AS MATRICULA');
  qryMatric.SQL.Add('        ,NULL AS IDREFERENCIA2');
  qryMatric.SQL.Add('        ,NULL AS IDREFERENCIA3');
  qryMatric.SQL.Add('    FROM (SELECT C1.*, ROWNUM SEQ');
  qryMatric.SQL.Add('            FROM (SELECT DP.IDTITULAR, DP.IDPESSOA, DP.MATRICULA, ''IR REGRESSIVO'' CONTEXTO');
  qryMatric.SQL.Add('                    FROM PREVIA P');
  qryMatric.SQL.Add('                   INNER JOIN DEPENTIT DP ON P.IDPESSOA = DP.IDPESSOA');
  qryMatric.SQL.Add('                                         AND P.IDTITULAR = DP.IDTITULAR');
  qryMatric.SQL.Add('                   WHERE P.MESCOBRANCA = TO_CHAR(SYSDATE, ''YYYY/MM'')');
  qryMatric.SQL.Add('                     AND P.IDRUBRICA IN (SELECT PV.IDPROVENTO FROM PROVDESC PV WHERE (UPPER(PV.DESCRICAO) LIKE ''%REGR%''))');
  qryMatric.SQL.Add('                   GROUP BY DP.IDTITULAR, DP.IDPESSOA, DP.MATRICULA');
  qryMatric.SQL.Add('                   ORDER BY DBMS_RANDOM.VALUE) C1) C11');
  qryMatric.SQL.Add('   WHERE C11.SEQ <= ' + FloatToStr(edtQtdePessoa.Value));
  qryMatric.SQL.Add('  UNION');
  qryMatric.SQL.Add('  SELECT C11.IDTITULAR AS IDTITULAR');
  qryMatric.SQL.Add('        ,C11.IDPESSOA AS IDPESSOA');
  qryMatric.SQL.Add('        ,C11.IDPESSOA AS IDREFERENCIA');
  qryMatric.SQL.Add('        ,C11.MATRICULA AS MATRICULA');
  qryMatric.SQL.Add('        ,NULL AS IDREFERENCIA2');
  qryMatric.SQL.Add('        ,NULL AS IDREFERENCIA3');
  qryMatric.SQL.Add('    FROM (SELECT C1.*, ROWNUM SEQ');
  qryMatric.SQL.Add('            FROM (SELECT DP.IDTITULAR, DP.IDPESSOA, DP.MATRICULA, ''PA'' CONTEXTO');
  qryMatric.SQL.Add('                    FROM PREVIA P');
  qryMatric.SQL.Add('                   INNER JOIN DEPENTIT DP ON P.IDPESSOA = DP.IDPESSOA');
  qryMatric.SQL.Add('                                         AND P.IDTITULAR = DP.IDTITULAR');
  qryMatric.SQL.Add('                   WHERE P.MESCOBRANCA = TO_CHAR(SYSDATE, ''YYYY/MM'')');
  qryMatric.SQL.Add('                     AND P.IDRUBRICA IN (SELECT PV.IDPROVENTO FROM PROVDESC PV WHERE PV.CODPROVDESC IN (''430304'', ''430404''))');
  qryMatric.SQL.Add('                   GROUP BY DP.IDTITULAR, DP.IDPESSOA, DP.MATRICULA');
  qryMatric.SQL.Add('                   ORDER BY DBMS_RANDOM.VALUE) C1) C11');
  qryMatric.SQL.Add('   WHERE C11.SEQ <= ' + FloatToStr(edtQtdePessoa.Value));
  qryMatric.SQL.Add('  UNION');
  qryMatric.SQL.Add('  SELECT C11.IDTITULAR AS IDTITULAR');
  qryMatric.SQL.Add('        ,C11.IDPESSOA AS IDPESSOA');
  qryMatric.SQL.Add('        ,C11.IDPESSOA AS IDREFERENCIA');
  qryMatric.SQL.Add('        ,C11.MATRICULA AS MATRICULA');
  qryMatric.SQL.Add('        ,NULL AS IDREFERENCIA2');
  qryMatric.SQL.Add('        ,NULL AS IDREFERENCIA3');
  qryMatric.SQL.Add('    FROM (SELECT C1.*, ROWNUM SEQ');
  qryMatric.SQL.Add('            FROM (SELECT DP.IDTITULAR, DP.IDPESSOA, DP.MATRICULA, ''EQUACIONAMENTO'' CONTEXTO');
  qryMatric.SQL.Add('                    FROM PREVIA P');
  qryMatric.SQL.Add('                   INNER JOIN DEPENTIT DP ON P.IDPESSOA = DP.IDPESSOA');
  qryMatric.SQL.Add('                                         AND P.IDTITULAR = DP.IDTITULAR');
  qryMatric.SQL.Add('                   WHERE P.MESCOBRANCA = TO_CHAR(SYSDATE, ''YYYY/MM'')');
  qryMatric.SQL.Add('                     AND P.IDRUBRICA IN (SELECT PV.IDPROVENTO FROM PROVDESC PV WHERE UPPER(PV.DESCRICAO) LIKE ''CONT%%EXTRAOR%'')');
  qryMatric.SQL.Add('                   GROUP BY DP.IDTITULAR, DP.IDPESSOA, DP.MATRICULA');
  qryMatric.SQL.Add('                   ORDER BY DBMS_RANDOM.VALUE) C1) C11');
  qryMatric.SQL.Add('   WHERE C11.SEQ <= ' + FloatToStr(edtQtdePessoa.Value));
  qryMatric.SQL.Add(') LD');
  qryMatric.SQL.Add('JOIN PESSOA PT ON LD.IDTITULAR = PT.IDPESSOA');
  qryMatric.SQL.Add('JOIN PESSOA PP ON LD.IDPESSOA = PP.IDPESSOA');
  qryMatric.Open;
  qryMatric.First;
  while not qryMatric.Eof do
  begin
    if not ExistePessoaLista(qryMatric.FieldByName('IDTITULAR').AsInteger,
                             qryMatric.FieldByName('IDPESSOA').AsInteger,
                             qryMatric.FieldByName('IDREFERENCIA').AsInteger) then
    begin
      qryDet.Append;
      qryDetIDLISTA.AsInteger         := GuardaIdLista;
      qryDetIDTITULAR.AsInteger       := qryMatric.FieldByName('IDTITULAR').AsInteger;
      qryDetIDPESSOA.AsInteger        := qryMatric.FieldByName('IDPESSOA').AsInteger;
      qryDetIDREFERENCIA.AsInteger    := qryMatric.FieldByName('IDREFERENCIA').AsInteger;
      qryDetTITULAR.AsString          := qryMatric.FieldByName('TITULAR').AsString;
      qryDetRECEBEDOR.AsString        := qryMatric.FieldByName('RECEBEDOR').AsString;
      qryDetMATRICULA.AsString        := qryMatric.FieldByName('MATRICULA').AsString;
      qryDetINSCRICAONUMERO.AsInteger := qryMatric.FieldByName('INSCRICAONUMERO').AsInteger;
      qryDetNUMDOCUMENTO.asstring     := qryMatric.fieldbyname('NUMDOCUMENTO').asstring;
      qryDet.Post;
    end;
    qryMatric.Next;
  end;
  qryMatric.Close;

  lblQuant.Caption := 'Quantidade: '+IntToStr(qryDet.RecordCount)+' pessoas ';
end;
// Fim - Alterado por FHBS - 25/06/2019 - SIG57770

// Alterado por FHBS - 25/06/2019 - SIG57770
procedure TFrmCadListaRecebedor.edtQtdePessoaExit(Sender: TObject);
begin
  inherited;
  if TwwDBSpinEdit(Sender).Value < 0 then
    TwwDBSpinEdit(Sender).Value := 0;
end;
// Fim - Alterado por FHBS - 25/06/2019 - SIG57770

end.

