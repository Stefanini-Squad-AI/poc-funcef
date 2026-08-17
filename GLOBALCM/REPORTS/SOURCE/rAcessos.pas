unit rAcessos;
//========================================================================
//
//  Data      : 17/02/2005
//  Pendência : 17974
//  Descrição : Incluir no relatório o nome do módulo
//
//========================================================================


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, ppVar, ppBands, ppClass, ppCtrls, ppReport, ppStrtch,
  ppSubRpt, ppPrnabl, ppCache, ppProd, DBTables, Wwquery, Wwdatsrc, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport,
  uCmSqlParams, DBClient, ppModule, daDataModule, TXRB;

type
  TRptAcessos = class(TFrmCmReport)
    pplUsuario: TppBDEPipeline;
    DsUsuario: TwwDataSource;
    rpUsuario: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    LblEmpresa: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    LblTitMembro: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand2: TppDetailBand;
    DbtNomeMembro: TppDBText;
    DbtDescrMembro: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    LblTitulo: TppLabel;
    LblNome: TppLabel;
    ppLabel4: TppLabel;
    LblDescricao: TppLabel;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel9: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand4: TppDetailBand;
    DbtNomeVisao: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel16: TppLabel;
    ppLabel10: TppLabel;
    ppDetailBand7: TppDetailBand;
    DbtColuna: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    DbtTabela: TppDBText;
    ppLabel8: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel26: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    LblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplGrupo: TppBDEPipeline;
    DsGrupo: TwwDataSource;
    pplTabela: TppBDEPipeline;
    DsTabela: TwwDataSource;
    pplDataview: TppBDEPipeline;
    DsDataview: TwwDataSource;
    pplDireito: TppBDEPipeline;
    DsDireito: TwwDataSource;
    CdsUsuario: TClientDataSet;
    SqlParUsuario: TCMSqlParams;
    CdsGrupo: TClientDataSet;
    SqlParGrupo: TCMSqlParams;
    CdsTabela: TClientDataSet;
    SqlParTabela: TCMSqlParams;
    SqlParDataview: TCMSqlParams;
    CdsDataview: TClientDataSet;
    CdsDireito: TClientDataSet;
    SqlParDireito: TCMSqlParams;
    ppLabel2: TppLabel;
    ppLbNomeModulo: TppLabel;
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptAcessos: TRptAcessos;
  snomeGrupo, snomeUsuario, sDescrGrupo, sDescrUsuario, sNomeModulo: String;

implementation

{$R *.DFM}

procedure TRptAcessos.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;
  If Not CmpRptCm.ParamValues[ 0 ].IsNull THen Begin
     LblTitulo.Caption        := 'Grupo:';
     LblNome.Caption          := snomegrupo;
     LblDescricao.Caption     := sDescrGrupo;
     LblTitMembro.Caption     := 'Usuários cadastrados';
     DbtNomeMembro.DataField  := 'NOMEUSUARIO';
     DbtDescrMembro.DataField := 'DESCRICAO';
  End Else Begin
     LblTitulo.Caption        := 'Usuário:';
     LblNome.Caption          := sNomeUsuario;
     LblDescricao.Caption     := sDescrUsuario;
     LblTitMembro.Caption     := 'Grupos Cadastrados';
     DbtNomeMembro.DataField  := 'NOMEGRUPO';
     DbtDescrMembro.DataField := 'DESCRICAO';
  End;

  //  P: 17974 - 17/02/2005
  ppLbNomeModulo.Caption      := sNomeModulo;


end;

procedure TRptAcessos.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  case Index of
       0: sNomeGrupo   := TPainelControles( Sender ).CtrlLookup.Text;
       1: sNomeUsuario := TPainelControles( Sender ).CtrlLookup.Text;
       2: Begin

         //  P: 17974 - 17/02/2005
         If Not (TPainelControles( Sender ).CtrlLookup.Text = '') THen Begin

          sNomeModulo := TPainelControles( Sender ).CtrlLookup.Text;

             With CmpRptCm.ParamValues[ 5 ].LookUpSettings Do Begin
                  Sql.Clear;
                  Sql.Add( 'Select x.IdOperFunc, f.NomeFuncao' );
                  Sql.Add( '  From OperFunc x, Funcao f' );
                  Sql.Add( ' Where x.IdFuncao = f.IdFuncao and' );
                  Sql.Add( '       x.IdModulo = ' + CmpRptCm.ParamValues[ 2 ].AsString );
                  Sql.Add( 'Order By NomeFuncao' );
                  Chave     := 'IdOperFunc';
                  Display   := 'NomeFuncao';
                  Descricao := 'Função';
             End;

          End
          //  P: 17974 - 17/02/2005
          else
             sNomeModulo := 'Todos';
  End;
  End;
end;




procedure TRptAcessos.CrmRptCMBeforePrint(Sender: TObject);
var
  ipos: Integer;
  sidgrupo, sidespacegrp, sidusuario, sidespaceusr, siddataview, sorigemcmdv,
  sidreports, sorigemcm: String;
begin
  inherited;
  If ( CmpRptCm.ParamValues[ 0 ].IsNull And CmpRptCm.ParamValues[ 1 ].IsNull ) Or
         ( ( Not CmpRptCm.ParamValues[ 0 ].IsNull ) And ( Not CmpRptCm.ParamValues[ 1 ].IsNull ) ) Then
     Raise Exception.Create( 'Informe ou o Usuário ou o Grupo a ser impresso.' );

  ipos         := Pos( '-', CmpRptCm.ParamValues[ 0 ].AsString );
  sidgrupo     := Copy( CmpRptCm.ParamValues[ 0 ].AsString, 1, ipos - 1 );
  sdescrGrupo  := Copy( CmpRptCm.ParamValues[ 0 ].AsString, ipos + 1, Length( CmpRptCm.ParamValues[ 0 ].AsString ) - ipos );
  ipos         := Pos( '-', sdescrGrupo );
  sidespacegrp := Copy( sdescrGrupo, 1, ipos - 1 );
  sdescrGrupo  := Copy( sdescrGrupo, ipos + 1, Length( sdescrGrupo ) - ipos );

  ipos          := Pos( '-', CmpRptCm.ParamValues[ 1 ].AsString );
  sidUsuario    := Copy( CmpRptCm.ParamValues[ 1 ].AsString, 1, ipos - 1 );
  sdescrusuario := Copy( CmpRptCm.ParamValues[ 1 ].AsString, ipos + 1, Length( CmpRptCm.ParamValues[ 1 ].AsString ) - ipos );
  ipos          := Pos( '-', sdescrUsuario );
  sidespaceusr  := Copy( sdescrUsuario, 1, ipos - 1 );
  sdescrUsuario := Copy( sdescrUsuario, ipos + 1, Length( sdescrUsuario ) - ipos );

  ipos        := Pos( '-', CmpRptCm.ParamValues[ 3 ].AsString );
  sidDataview := Copy( CmpRptCm.ParamValues[ 3 ].AsString, 1, ipos - 1 );
  sorigemcmdv := Copy( CmpRptCm.ParamValues[ 3 ].AsString, ipos + 1, Length( CmpRptCm.ParamValues[ 3 ].AsString ) - ipos );

  ipos       := Pos( '-', CmpRptCm.ParamValues[ 4 ].AsString );
  sidreports := Copy( CmpRptCm.ParamValues[ 4 ].AsString, 1, ipos - 1 );
  sorigemcm  := Copy( CmpRptCm.ParamValues[ 4 ].AsString, ipos + 1, Length( CmpRptCm.ParamValues[ 4 ].AsString ) - ipos );

  If ( CmpRptCm.ParamValues[ 0 ].IsNull And CmpRptCm.ParamValues[ 1 ].IsNull ) Or
         ( ( Not CmpRptCm.ParamValues[ 0 ].IsNull ) And ( Not CmpRptCm.ParamValues[ 1 ].IsNull ) ) Then Begin
     sIdGrupo     := '-1';
     sIdUsuario   := '-1';
     sIdEspAceGrp := '-1';
     sIdEspAceUsr := '-1';
  End;

  If Not CmpRptCm.ParamValues[ 0 ].IsNull Then Begin
     With SqlParUsuario Do Begin
          Sql.Clear;
          Sql.Add( 'Select NomeGrupo, Descricao' );
          Sql.Add( 'From GrupoAcesso' );
          Sql.Add( 'Where IdGrupo = ' + sidgrupo );
          Open;
     End;

     With SqlParGrupo Do Begin
          Sql.Clear;
          Sql.Add( 'Select u.NomeUsuario, u.Descricao' );
          Sql.Add( '  From UsuarioSistema u, GrupoUsu r' );
          Sql.Add( ' Where r.IdGrupo   = ' + sidgrupo );
          Sql.Add( '   and r.IdUsuario = u.IdUsuario' );
          Sql.Add( 'Order By NomeUsuario' );
          Open;
     End;

     With SqlParDataview Do Begin
          Sql.Clear;
          Sql.Add( 'Select d.Name' );
          Sql.Add( '  From DataviewAcesso a, Dataview d' );
          Sql.Add( ' Where a.IdEspAcesso = ' + sidespacegrp );
          Sql.Add( '   and a.IdDataview  = d.IdDataview' );
          Sql.Add( '   and a.OrigemCmdv  = d.OrigemCmdv' );
          Sql.Add( 'Order By Name' );
          Open;
     End;

     With SqlParTabela Do Begin
          Sql.Clear;
          Sql.Add( 'Select t.Table_Name, c.Column_Name' );
          Sql.Add( '  From TabelaAcesso t, ColunaAcesso c' );
          Sql.Add( ' Where t.IdEspAcesso = ' + sidespacegrp );
          Sql.Add( '   and t.IdEspAcesso = c.IdEspAcesso(+)' );
          Sql.Add( '   and t.Table_Name  = c.Table_Name(+)' );
          Sql.Add( 'Order By Table_Name' );
          Open;
     End;

     With SqlParDireito Do Begin
          Sql.Clear;
          Sql.Add( 'Select o.NomeOperacao, f.NomeFuncao' );
          Sql.Add( '  From Autoriza a, OperFunc s, Operacao o, Funcao f' );
          Sql.Add( ' Where a.IdEspAcesso = ' + sidespacegrp );
          Sql.Add( '   and a.IdOperFunc  = s.IdOperFunc' );
          Sql.Add( '   and s.IdOperacao  = o.IdOperacao' );
          Sql.Add( '   and s.IdFuncao    = f.IdFuncao' );
          Sql.Add( 'Order By NomeFuncao, NomeOperacao' );
          Open;
          CdsDireito.data;
     End;
  End Else Begin
     With SqlParUsuario Do Begin
          Sql.Clear;
          Sql.Add( 'Select NomeUsuario, Descricao' );
          Sql.Add( 'From UsuarioSistema' );
          Sql.Add( 'Where IdUsuario = ' + sidUsuario );
          Open;
     End;

     With SqlParGrupo Do Begin
          Sql.Clear;
          Sql.Add( 'Select g.NomeGrupo, g.Descricao' );
          Sql.Add( '  From GrupoAcesso g, GrupoUsu r' );
          Sql.Add( ' Where r.IdUsuario = ' + sidusuario );
          Sql.Add( '   and r.IdGrupo   = g.IdGrupo' );
          Sql.Add( 'Order By NomeGrupo' );
          Open;
     End;

     With SqlParDataview Do Begin
          Sql.Clear;
          Sql.Add( 'Select d.Name' );
          Sql.Add( '  From DataviewAcesso a, Dataview d' );
          Sql.Add( ' Where a.IdEspAcesso = ' + sidespaceusr );
          Sql.Add( '   and a.IdDataview  = d.IdDataview' );
          Sql.Add( '   and a.OrigemCmdv  = d.OrigemCmdv' );
          Sql.Add( 'Order By Name' );
          Open;
     End;

     With SqlParTabela Do Begin
          Sql.Clear;
          Sql.Add( 'Select t.Table_Name, c.Column_Name' );
          Sql.Add( '  From TabelaAcesso t, ColunaAcesso c' );
          Sql.Add( ' Where t.IdEspAcesso = ' + sidespaceusr );
          Sql.Add( '   and t.IdEspAcesso = c.IdEspAcesso(+)' );
          Sql.Add( '   and t.Table_Name  = c.Table_Name(+)' );
          Sql.Add( 'Order By Table_Name' );
          Open;
     End;

     With SqlParDireito Do Begin
          Sql.Clear;
          Sql.Add( 'Select o.NomeOperacao, f.NomeFuncao' );
          Sql.Add( '  From Autoriza a, OperFunc s, Operacao o, Funcao f' );
          Sql.Add( ' Where a.IdEspAcesso = ' + sidespaceusr );
          Sql.Add( '   and a.IdOperFunc  = s.IdOperFunc' );
          Sql.Add( '   and s.IdOperacao  = o.IdOperacao' );
          Sql.Add( '   and s.IdFuncao    = f.IdFuncao' );
          Sql.Add( 'Order By NomeFuncao, NomeOperacao' );
          Open;

     End;
  End;
end;






end.
